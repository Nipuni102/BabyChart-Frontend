import 'package:flutter/material.dart';
import 'enter_vaccination.dart';

/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink,
      ),
      home: DashboardScreen(),
    );
  }
}*/

class MidHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('BabyChart'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(
                context, '/midSignIn'); // Navigate to the login page
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'assets/images/profile_picture.png'), // Replace with your image path
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
            SizedBox(height: 40),
            Expanded(
              child: ListView(
                children: [
                  buildCard(
                    context,
                    'Register Users',
                    'assets/register_users.png', // Replace with your image path
                    () {
                      // Handle Register Users button press
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
                            builder: (context) => EnterVaccination()),
                      );
                    },
                  ),
                  buildCard(
                    context,
                    'Enter Chart Data',
                    'assets/enter_chart_data.png', // Replace with your image path
                    () {
                      // Handle Enter Chart Data button press
                    },
                  ),
                  buildCard(
                    context,
                    'Set Reminders',
                    'assets/set_reminders.png', // Replace with your image path
                    () {
                      // Handle Set Reminders button press
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String title, String imagePath,
      VoidCallback onPressed) {
    return Card(
      color: Colors.pink[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: Image.asset(imagePath, width: 90, height: 90),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
