import 'dart:async';

import 'package:bg_launcher/bg_launcher.dart';
import 'package:flutter/material.dart' hide Intent;
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:receive_intent/receive_intent.dart';

class ExempleReceive extends StatefulWidget {
  const ExempleReceive({Key? key}) : super(key: key);

  @override
  State<ExempleReceive> createState() => _ExempleReceiveState();
}

class _ExempleReceiveState extends State<ExempleReceive> {
  @override
  void initState() {
    super.initState();
    FlutterOverlayWindow.isPermissionGranted().then((value) {
      if (!value) {
        FlutterOverlayWindow.requestPermission();
      }
    });
    Timer.periodic(const Duration(seconds: 10), (timer) {
      BgLauncher.bringAppToForeground(
        action: 'FBI-OPEN-UP',
        extras: 'At: ${DateTime.now()}',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StreamBuilder<Intent?>(
                stream: ReceiveIntent.receivedIntentStream,
                builder: (context, snapshot) {
                  final intent = snapshot.data;
                  return Center(
                    child: Column(
                      children: [
                        const Text("BG Launcher: "),
                        Text('action: ${intent?.action}'),
                        Text("extras: ${intent?.extra?['extras']}"),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
