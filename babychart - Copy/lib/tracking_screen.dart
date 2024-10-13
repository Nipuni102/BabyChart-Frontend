import 'package:flutter/material.dart';

// TrackingScreen Widget
class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Tracking',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF8E42D6),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white, // White icon color
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 25), // Correct placement of the SizedBox
            // Grid for cards (Feed, Nappy, Sleep, Health)

            Text(
              'Tracking',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 25),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // Two items per row
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  buildOptionCard('Feed', 'assets/feed.png'),
                  buildOptionCard('Nappy', 'assets/nappy.png'),
                  buildOptionCard('Sleep', 'assets/sleep.png'),
                  buildOptionCard('Health', 'assets/health.png'),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Recent Entries Section
            const Center(
              child: Text(
                'Recent Entries',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Rounded containers for recent entries with different images
            buildRecentEntryCard('Sleep', 'Piyumi slept 7hr and 30 min',
                '9:00 p.m\n 4:30 a.m', 'assets/sleep_image.png'),
            buildRecentEntryCard('Diaper', 'Piyumi had wet diaper', '11:30 a.m',
                'assets/nappy_image.png'),
          ],
        ),
      ),
    );
  }

  // Function to build each option card with a background image
  Widget buildOptionCard(String title, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath), // Use the image as the background
          fit: BoxFit.cover, // Cover the entire card
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 105), // Add more space below the image
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF654089), // Adjust the text color
            ),
          ),
        ],
      ),
    );
  }

  // Function to build recent entry card with title, description, time, and image
  Widget buildRecentEntryCard(
      String title, String description, String time, String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.purple,
                child: ClipOval(
                  // Clip the image to fit within the CircleAvatar
                  child: Image.asset(
                    imagePath, // Use the image path passed to the function
                    fit: BoxFit.cover,
                    width:
                        40, // Adjust width and height to fit properly inside CircleAvatar
                    height: 40,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            time,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
