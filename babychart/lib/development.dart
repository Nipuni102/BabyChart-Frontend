import 'package:flutter/material.dart';
import 'package:babychart/activity.dart';

class DevelopmentScreen extends StatefulWidget {
  const DevelopmentScreen({Key? key}) : super(key: key);

  @override
  _DevelopmentScreenState createState() => _DevelopmentScreenState();
}

class _DevelopmentScreenState extends State<DevelopmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('BabyChart'),
        centerTitle: true,
      ),*/
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle "Track Daily Habits" button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                'Track Daily Habits',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20),
            buildOptionCard('Eyesight', 'assets/eyesight.jpeg', null),
            buildOptionCard('Hearing', 'assets/hearing.jpeg', null),
            buildOptionCard('Activities', 'assets/activities.jpeg',
                const ActivitiesScreen()),
            buildOptionCard('Dental', 'assets/dental.jpeg', null),
          ],
        ),
      ),
    );
  }

  Widget buildOptionCard(String title, String imagePath, Widget? destination) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Image.asset(
          imagePath,
          width: 60,
          height: 60,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        onTap: () {
          if (destination != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destination),
            );
          }
        },
      ),
    );
  }
}
