
import 'package:flutter/material.dart';

class SendRemindersScreen extends StatefulWidget {
  @override
  _SendRemindersScreenState createState() => _SendRemindersScreenState();
}

class _SendRemindersScreenState extends State<SendRemindersScreen> {
  String selectedAge = 'Select Age';
  String selectedArea = 'Select Area';

  List<String> ages = ['Select Age', '0-1', '1-2', '2-3', '3-4', '4-5'];
  List<String> areas = ['Select Area', 'Area 1', 'Area 2', 'Area 3', 'Area 4'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('BabyChart'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserProfile(),
            SizedBox(height: 20),
            Text(
              'Send Reminders',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Filter based on Age'),
                  DropdownButton<String>(
                    value: selectedAge,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedAge = newValue!;
                      });
                    },
                    items: ages.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  Text('Filter based on area'),
                  DropdownButton<String>(
                    value: selectedArea,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedArea = newValue!;
                      });
                    },
                    items: areas.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle send reminder button press
                },
                child: Text('Send Reminder'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          radius: 25,
        ),
        SizedBox(width: 10),
        Text(
          'G.H.K. Wijerathna',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
