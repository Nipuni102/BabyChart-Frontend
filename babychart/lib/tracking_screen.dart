import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  buildOptionCard('Feed', 'assets/feed.png', null),
                  buildOptionCard('Nappy', 'assets/nappy.png', null),
                  buildOptionCard('Sleep', 'assets/sleep.png',
                      'https://baby-chart-sleep-tracker.vercel.app'),
                  buildOptionCard('Health', 'assets/health.png', null),
                ],
              ),
            ),
            const SizedBox(height: 10),

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

            buildRecentEntryCard('Sleep', 'Piyumi slept 7hr and 30 min',
                '9:00 p.m\n    to\n 4:30 a.m', 'assets/sleep_image.png'),
            buildRecentEntryCard('Diaper', 'Piyumi had wet diaper', '11:30 a.m',
                'assets/nappy_image.png'),
          ],
        ),
      ),
    );
  }

  Widget buildOptionCard(String title, String imagePath, String? url) {
    return InkWell(
      onTap: url != null ? () => _launchURL(url) : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const SizedBox(height: 135),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF654089),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: 40,
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

  // Function to launch the URL using Uri and launchUrl
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url); // Parse the URL into Uri
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
