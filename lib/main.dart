// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:test_app/widgets/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
           appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white //here you can give the text color
          )
         ),
      home: const LoginScreen(),
    );
  }
}
