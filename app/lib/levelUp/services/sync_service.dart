import 'package:connectivity_plus/connectivity_plus.dart';
import '../database/database_helper.dart';
import 'api_service.dart';

class SyncService {
  final ApiService apiService;
  final DatabaseHelper databaseHelper = DatabaseHelper();

  SyncService({required this.apiService});

  Future<void> syncData() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return; // No internet connection
    }

    final db = await databaseHelper.database;

    // Sync users
    final unsyncedUsers = await db.query('users', where: 'synced = ?', whereArgs: [0]);
    for (var user in unsyncedUsers) {
      final response = await apiService.register(user);
      if (response.statusCode == 200) {
        await db.update('users', {'synced': 1}, where: 'id = ?', whereArgs: [user['id']]);
      }
    }

    // Sync habit logs
    final unsyncedLogs = await db.query('habit_logs', where: 'synced = ?', whereArgs: [0]);
    for (var log in unsyncedLogs) {
      final response = await apiService.sync(log);
      if (response.statusCode == 200) {
        await db.update('habit_logs', {'synced': 1}, where: 'id = ?', whereArgs: [log['id']]);
      }
    }
  }
}