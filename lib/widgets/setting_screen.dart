
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SettingState();
}

class _SettingState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
            title: const Text("Settings"),
          ),
      body: const SafeArea(child: Text("data")),
    );
  }
}