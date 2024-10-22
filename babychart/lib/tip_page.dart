import 'package:flutter/material.dart';

class DescriptionPage extends StatefulWidget {
  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  // A single Map to store all descriptions for all categories
  final Map<String, String> healthTipsDescriptions = {
    'Feeding_Tips':
        'Breastfeeding is essential for newborns to get all necessary nutrients.',
    'Sleeping_Suggestions':
        'A dark room helps babies sleep better without distractions.',
    'Exercise_Recommendations':
        'Tummy time helps strengthen neck and shoulder muscles for crawling.',
    'Health_Checks':
        'Pediatrician visits are crucial to track your baby\'s growth and development.',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF67418C), // AppBar background color
        title: const Text(
          'Growth insights',
          style: TextStyle(
            fontSize: 20, // Set the font size of the title
            fontWeight: FontWeight.bold, // Set the font weight
            color: Colors.white, // Set the title text color
          ),
        ),
        elevation: 0, // Remove the AppBar shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.white), // Back arrow icon color
          onPressed: () {
            Navigator.pop(context); // Use pop to go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Add an image at the top
              Image.asset(
                'assets/weight1.png', // Replace with the actual path of your image
                height: 400,
                width: 450,
              ),

              Text(
                'How to Support Your Baby\'s Growth',
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 8, 8, 8),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 1),

              // ExpansionTile for Feeding Tips
              _buildCategoryTile(
                'Feeding Tips',
                healthTipsDescriptions['Feeding_Tips'] ??
                    'No description available',
              ),

              const SizedBox(height: 4),

              // ExpansionTile for Sleeping Suggestions
              _buildCategoryTile(
                'Sleeping Suggestions',
                healthTipsDescriptions['Sleeping_Suggestions'] ??
                    'No description available',
              ),

              const SizedBox(height: 4),

              // ExpansionTile for Exercise Recommendations
              _buildCategoryTile(
                'Exercise Recommendations',
                healthTipsDescriptions['Exercise_Recommendations'] ??
                    'No description available',
              ),

              const SizedBox(height: 4),

              // ExpansionTile for Health Checks
              _buildCategoryTile(
                'Health Checks',
                healthTipsDescriptions['Health_Checks'] ??
                    'No description available',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create ExpansionTile for each category
  Widget _buildCategoryTile(String title, String description) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      elevation: 4, // Adding shadow to the tile
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: const Color(0xFFD9ACFD), // Set background color for the Card
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color.fromARGB(255, 76, 75, 76), // Title color
          ),
        ),
        backgroundColor:
            Colors.purple.shade50, // Light background color when expanded
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white, // Background color for the description area
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // Shadow position
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  height: 1.5, // Line height for better readability
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
