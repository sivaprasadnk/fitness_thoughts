import 'package:flutter/services.dart';

class AppVersion {
  static const MethodChannel _channel = MethodChannel("app_version");

  static Future<String?> getVersion() async {
    try {
      final String? version = await _channel.invokeMethod('getVersion');
      return version;
    } on PlatformException catch (e) {
      return "Failed to get version: '${e.message}'.";
    }
  }
}
