import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart'; // Main screen comes after splash

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showSlogan = false;

  @override
  void initState() {
    super.initState();

    // Show slogan after 1.5 seconds (can keep this or adjust as desired)
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        showSlogan = true;
      });
    });

    // Navigate after 6 seconds instead of 3.5
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const WeatherScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedOpacity(
          opacity: 1,
          duration: const Duration(milliseconds: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cloud, size: 100, color: Colors.white),
              const SizedBox(height: 30),
              if (showSlogan)
                const Text(
                  "Weather the day, your way ☁️",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
