// main.dart
import 'package:flutter/material.dart';
import 'splashScreen.dart'; // Import your splash screen

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Two‑Step Onboarding',
      theme: ThemeData(
        useMaterial3: true, // nice modern look, optional
        colorSchemeSeed: Colors.blue,
      ),
      home: const SplashScreen(),             // <-- starts here
    );
  }
}
