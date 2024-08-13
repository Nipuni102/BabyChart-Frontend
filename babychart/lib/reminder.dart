import 'package:flutter/material.dart';

class SendRemindersScreen extends StatefulWidget {
  @override
  _SendRemindersScreenState createState() => _SendRemindersScreenState();
}

class _SendRemindersScreenState extends State<SendRemindersScreen> {
  String selectedAge = 'Select Age';
  String selectedArea = 'Select Area';
  TextEditingController messageController = TextEditingController();

  List<String> ages = ['Select Age', '0-1', '1-2', '2-3', '3-4', '4-5'];
  List<String> areas = ['Select Area', 'Area 1', 'Area 2', 'Area 3', 'Area 4'];

  void _sendReminder() {
    String message = messageController.text;

    if (message.isEmpty) {
      // Show a message if the text field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a notification message.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      // Perform the send reminder action here
      // ...

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Reminder sent successfully!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          'BabyChart',
          style: TextStyle(color: Colors.white), // Set title color to black
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Handle back button press
          },
        ),
      ),
      body: SingleChildScrollView(
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
                  Text('Filter based on Area'),
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
                  SizedBox(height: 20),
                  Text('Notification Message'),
                  TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your notification message here',
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _sendReminder,
                child: Text('Send Reminder', style: TextStyle(color: Colors.white)),
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
          radius: 30,
          backgroundImage: AssetImage('assets/midwife.png'), 
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
