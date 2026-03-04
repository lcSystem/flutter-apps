import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<http.Response> register(Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl/register.php');
    return await http.post(url, body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
  }

  Future<http.Response> login(Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl/login.php');
    return await http.post(url, body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
  }

  Future<http.Response> sync(Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl/sync.php');
    return await http.post(url, body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
  }

  Future<http.Response> getRanking() async {
    final url = Uri.parse('$baseUrl/ranking.php');
    return await http.get(url);
  }
}