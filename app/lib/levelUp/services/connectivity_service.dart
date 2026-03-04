import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _subscription;

  void monitorConnection(Function(ConnectivityResult) onChange) {
    _subscription = _connectivity.onConnectivityChanged.listen(onChange);
  }

  void dispose() {
    _subscription.cancel();
  }
}