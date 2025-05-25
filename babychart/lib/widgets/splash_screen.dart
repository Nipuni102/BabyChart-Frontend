import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the home ("/") after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255), // white background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Main logo with bottom spacing
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Image.asset(
                'assets/logo_v2.png',
                height: 300,
              ),
            ),

            // Text logo slightly lifted up
            Transform.translate(
              offset: Offset(8, -50), // move 10 pixels upward
              child: Image.asset(
                'assets/text_logo.png',
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
