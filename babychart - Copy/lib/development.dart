import 'package:babychart/tracking_screen.dart';
import 'package:flutter/material.dart';

class DevelopmentScreen extends StatelessWidget {
  final VoidCallback onNavigateToActivities;

  const DevelopmentScreen({super.key, required this.onNavigateToActivities});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Development',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Grid for development options
          Expanded(
            child: Column(
              children: [
                // GridView for the first four cards
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Two cards per row
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.9,
                    ),
                    itemCount: 4, // Total number of items in the grid (4 cards)
                    itemBuilder: (context, index) {
                      List<Map<String, dynamic>> options = [
                        {
                          'title': 'Tracking',
                          'image':
                              'assets/tracking.png', // Replace with image path
                          'color': Colors.purpleAccent,
                          'onTap': () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TrackingScreen(),
                              ),
                            );
                          }
                        },
                        {
                          'title': 'Eyesight',
                          'image':
                              'assets/eyesight.png', // Replace with image path
                          'color': Colors.pinkAccent,
                          'onTap': null
                        },
                        {
                          'title': 'Hearing',
                          'image':
                              'assets/hearing.png', // Replace with image path
                          'color': Colors.purpleAccent,
                          'onTap': null
                        },
                        {
                          'title': 'Dental',
                          'image':
                              'assets/dental.png', // Replace with image path
                          'color': Colors.pinkAccent,
                          'onTap': null
                        },
                      ];

                      return buildOptionCard(
                        options[index]['title'],
                        options[index]['image'],
                        Color(
                            0xFFD9ACFD), // Using one consistent color for all cards
                        options[index]['onTap'],
                      );
                    },
                  ),
                ),
                // Milestones card with full width (400px width)
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16), // Add some padding for spacing
                  child: Center(
                    child: Container(
                      width: 400, // Fixed width for the Milestones card
                      child: buildOptionCard(
                        'Milestones',
                        'assets/feet.png', // Replace with image path
                        Color(0xFFD9ACFD), // Using the same consistent color
                        onNavigateToActivities,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOptionCard(
      String title, String imagePath, Color cardColor, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: cardColor, // Single consistent card color
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath, // Replace this with the correct image path
              height: 60, // Adjust the size of the image as needed
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Set title color to white
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
