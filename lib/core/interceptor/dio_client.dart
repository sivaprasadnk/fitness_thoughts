import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/core/interceptor/retry_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DioClient {
  final Dio _dio;
  final Connectivity _connectivity;

  DioClient(this._dio, this._connectivity) {
    _dio
      ..options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      )
      ..interceptors.addAll([
        _connectivityInterceptor(), // Interceptor to handle connectivity loss
        _retryInterceptor(),
        // LogInterceptor(responseBody: true), // Debugging logs
      ]);
  }

  /// Retry Interceptor (for automatic retries)
  RetryInterceptor _retryInterceptor() {
    return RetryInterceptor(
      connectivity: _connectivity,
      dio: _dio,
      // logPrint: (message) => print("Retry: $message"),
      // retries: 3, // Retry up to 3 times
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 3),
        Duration(seconds: 5),
      ],
    );
  }

  /// Interceptor to wait for internet connectivity before retrying failed requests
  InterceptorsWrapper _connectivityInterceptor() {
    return InterceptorsWrapper(
      onError: (DioException e, handler) async {
        if (_isNetworkError(e)) {
          Fluttertoast.showToast(
            msg: "No internet connection. Waiting for reconnection...",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          print("No internet connection. Waiting for reconnection...");
          await _waitForInternet();
          Fluttertoast.showToast(
            msg: "Internet reconnected...",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          print("Internet reconnected. Retrying request...");
          return handler.resolve(await _dio.fetch(e.requestOptions));
        }
        return handler.next(e);
      },
    );
  }

  /// Check if the error is due to no internet connection
  bool _isNetworkError(DioException e) {
    return e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout;
  }

  /// Wait until connectivity is restored
  Future<void> _waitForInternet() async {
    StreamSubscription<List<ConnectivityResult>>? subscription;
    final Completer<void> completer = Completer<void>();

    subscription = _connectivity.onConnectivityChanged.listen((result) {
      if (!result.contains(ConnectivityResult.none)) {
        completer.complete();
        subscription?.cancel();
      }
    });

    return completer.future;
  }

  /// Example GET request
  Future<Response> getRequest(String endpoint) async {
    return await _dio.get(endpoint);
  }
}

/// Dummy method to get the authentication token
String getAuthToken() {
  return "your_access_token";
}
