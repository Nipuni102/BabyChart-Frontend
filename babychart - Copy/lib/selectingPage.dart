import 'package:babychart/midSignIn.dart';
import 'package:babychart/signInPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SelectingPage(),
    );
  }
}

class SelectingPage extends StatelessWidget {
  const SelectingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFB16FEF), // Background color
              Color(0xFF654089),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 80), // Space from the top
            const Text(
              'Choose Profile',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255), // Purple text
              ),
            ),
            const SizedBox(
                height: 10), // Space between the title and the purple box
            Center(
              child: Container(
                padding:
                    const EdgeInsets.all(20), // Padding around the purple box
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(0, 176, 109, 238), // Dark purple
                      Color.fromARGB(0, 102, 65, 140), // Light purple
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                height: 700, // Set the desired height
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40), // Space before the options
                    buildProfileOption(
                      context,
                      'Parent Account',
                      'assets/parent_new.png', // Ensure this image path is correct
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
                        );
                      },
                      imageWidth: 120, // Increased image width
                      imageHeight: 120, // Increased image height
                    ),
                    const SizedBox(height: 30),
                    buildProfileOption(
                      context,
                      'Midwife Account',
                      'assets/midwife_new.png', // Ensure this image path is correct
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MidSignInPage()),
                        );
                      },
                      imageWidth: 120, // Increased image width
                      imageHeight: 120, // Increased image height
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileOption(
      BuildContext context, String title, String imagePath, VoidCallback onTap,
      {double imageWidth = 100, double imageHeight = 100}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        elevation: 6, // Adds shadow to the card for a raised effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white, // White background for the card
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Wrap image in Flexible or FittedBox to prevent overflow
              Flexible(
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(20), // Add rounded corners
                  child: Image.asset(
                    imagePath,
                    width: imageWidth,
                    height: imageHeight,
                    fit: BoxFit.contain, // Contain image within the card
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8E44AD), // Purple text for consistency
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
