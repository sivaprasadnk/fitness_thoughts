import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  ConnectivityService(this.scaffoldMessengerKey);

  void startListening() {
    _subscription = _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      _showSnackbar(result);
    });
  }

  void _showSnackbar(List<ConnectivityResult> result) {
    final message = !result.contains(ConnectivityResult.none)
        ? "⚠️ No internet connection!"
        : "✅ Back online!";
    final color =
        !result.contains(ConnectivityResult.none) ? Colors.red : Colors.green;

    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void dispose() {
    _subscription.cancel();
  }
}
