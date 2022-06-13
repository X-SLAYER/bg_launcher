import 'dart:async';

import 'package:bg_launcher/bg_launcher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              Timer.periodic(const Duration(seconds: 8), (timer) {
                BgLauncher.bringAppToForeground();
              });
            },
            child: const Text('Launch'),
          ),
        ),
      ),
    );
  }
}
