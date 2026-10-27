import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const PushlyApp());
}

class PushlyApp extends StatelessWidget {
  const PushlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pushly',
      theme: ThemeData(colorSchemeSeed: Colors.deepOrange, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}
