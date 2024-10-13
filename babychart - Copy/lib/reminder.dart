import 'package:flutter/material.dart';

class SendRemindersScreen extends StatefulWidget {
  const SendRemindersScreen({super.key});

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
        const SnackBar(
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
        const SnackBar(
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
        backgroundColor: Colors.purple,
        title: const Text(
          'Send Reminders',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Handle back button press
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const UserProfile(),
            const SizedBox(height: 20),
            const Text(
              'Send Reminders',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 30),

            // Wrapping form elements in a Container for style
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color(0xFFF1D1FA), // Light purple background
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Select Area'),
                  const SizedBox(height: 30),
                  DropdownButtonFormField<String>(
                    value: selectedArea,
                    isExpanded: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:
                          Colors.pink[100], // Pink background for dropdown
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
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
                  const SizedBox(height: 30),
                  const Text('Notification Message'),
                  const SizedBox(height: 30),
                  TextField(
                    controller: messageController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:
                          Colors.pink[100], // Pink background for TextField
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Enter your notification message here',
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _sendReminder,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, // Purple button background
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Send Reminder',
                  style: TextStyle(color: Colors.white),
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
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage:
              AssetImage('assets/profile_pic.png'), // Replace with your image
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
