import 'package:flutter/services.dart';

class BgLauncher {
  BgLauncher._();

  static const MethodChannel _channel = MethodChannel('bg_launcher');

  /// `extras` & `action` are useful if you want to determine
  /// what you will do when you bring the app from background
  /// you can use `receive_intent` package and filter them with
  /// the action & extras to show your own UI/ logic ...
  static void bringAppToForeground({
    String? action,
    Map<String, String>? extras,
  }) {
    _channel.invokeMethod("bringAppToForeground", {
      'action': action,
      'extras': extras,
    });
  }
}
