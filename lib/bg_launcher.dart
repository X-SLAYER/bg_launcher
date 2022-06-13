import 'package:flutter/services.dart';

class BgLauncher {
  BgLauncher._();

  static const MethodChannel _channel = MethodChannel('bg_launcher');

  static void bringAppToForeground({String? extras, String? action}) {
    _channel.invokeMethod("bringAppToForeground", {
      'extras': extras,
      'action': action,
    });
  }
}
