import 'package:babychart/childRegister.dart';
import 'package:babychart/enter_chart_data.dart';
import 'package:babychart/reminder.dart';
import 'package:flutter/material.dart';

import 'enter_vaccination.dart';

class MidHome extends StatelessWidget {
  const MidHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8E42D6),
        title: const Text(
          'BabyChart',
          style: TextStyle(color: Colors.white), // Set title color to white
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(
                context, '/midSignIn'); // Navigate to login page
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // White background for the entire content
            borderRadius: BorderRadius.circular(20), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5), // Shadow effect
              ),
            ],
          ),
          padding: const EdgeInsets.all(20), // Padding inside the white box
          child: Column(
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile_pic.png'),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'G.H.K. Wijerathna',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Space between image and cards
              // Image above the cards
              Image.asset(
                'assets/Frame2.png', // Replace with your image path
                width: MediaQuery.of(context).size.width, // Full width
                height: 180, // Adjust height
                fit: BoxFit.cover, // Image should cover the area
              ),
              const SizedBox(height: 10), // Reduced the space after the image
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2, // Display two cards per row
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        children: [
                          buildCard(
                            context,
                            'Register Users',
                            'assets/register_users.png', // Replace with your image path
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ChildRegister()),
                              );
                            },
                          ),
                          buildCard(
                            context,
                            'Enter Vaccination',
                            'assets/enter_vaccination.png', // Replace with your image path
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EnterVaccination()),
                              );
                            },
                          ),
                          buildCard(
                            context,
                            'Enter Chart Data',
                            'assets/enter_chart_data.png', // Replace with your image path
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EnterChartData()),
                              );
                            },
                          ),
                          buildCard(
                            context,
                            'Set Reminders',
                            'assets/remin.png',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SendRemindersScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Full-width card outside the grid
                    buildFullWidthCard(
                      context,
                      'View Parent Profile',
                      'assets/search.png', // Replace with your image path
                      () {
                        // Action for the full-width card
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String title, String imagePath,
      VoidCallback onPressed) {
    return Card(
      color: const Color(0xFFF292DD),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(imagePath, width: 80, height: 80), // Image at the top
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center, // Align the text to the center
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFullWidthCard(BuildContext context, String title,
      String imagePath, VoidCallback onPressed) {
    return Container(
      width: double.infinity, // Full width of the screen
      child: Card(
        color: const Color(0xFFF292DD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(imagePath, width: 70, height: 60), // Image
                const SizedBox(width: 20),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
