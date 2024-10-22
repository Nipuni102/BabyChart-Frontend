import 'package:flutter/material.dart';

import 'chart_screen.dart'; // Import the chart screen

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Align the text to the start
          children: [
            // Title for the page
            const Text(
              'Charts', // Title text
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF67418C), // Matches the card border color
              ),
            ),
            const SizedBox(
                height: 20), // Add spacing between the title and the cards

            // Card for "Age - Weight"
            buildOptionCard(
              context,
              'Age - Weight',
              'assets/Age_weight.png', // Replace with your image path
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChartScreen()),
                );
              },
            ),
            const SizedBox(height: 25),

            // Card for "Age - Height"
            buildOptionCard(
              context,
              'Age - Height',
              'assets/Age_height.png', // Replace with your image path
              () {
                // Logic for Age - Height
              },
            ),
            const SizedBox(height: 25),

            // Card for "Height - Weight"
            buildOptionCard(
              context,
              'Height - Weight',
              'assets/weight_height.png', // Replace with your image path
              () {
                // Logic for Height - Weight
              },
            ),
          ],
        ),
      ),
    );
  }

  // Function to build the option card with full image background
  Widget buildOptionCard(BuildContext context, String title, String imagePath,
      VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 150, // Set a fixed height for the card
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFF9E64B4), width: 2),
        ),
        child: Stack(
          children: [
            // Full image background
            ClipRRect(
              borderRadius: BorderRadius.circular(
                  15), // Clip the image to make rounded corners
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover, // Make the image cover the full container
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            // Text overlay
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(
                      255, 157, 45, 169), // White text over the image
                  shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(
                          0, 9, 9, 9), // Shadow to make text more readable
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
}
