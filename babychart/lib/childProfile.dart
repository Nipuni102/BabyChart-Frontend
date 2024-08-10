import 'package:babychart/API/token.dart';
import 'package:babychart/myQRCode.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String? token = AuthToken().token;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFCC31A1),
        title: Text('BabyChart'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink[100]!, Colors.pink[200]!],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/piumi.png'),
                ),
                SizedBox(height: 10),
                Text(
                  'Ranasinghalage Piumi Wathsala Ranasingha',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 35, 35, 36),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                   onPressed: () {
                    if (token != null && token.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyQRCodeScreen(token: token),
                        ),
                      );
                    } else {
                      // Handle the case where token is null or empty
                      print('No token found');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color(0xFFCC31A1), // Button background color
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    'My QR Code',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                buildInfoSection('Child Information', [
                  buildInfoRow('Date of Birth', '2021.10.08'),
                  buildInfoRow('District', 'Gampaha'),
                  buildInfoRow('Address', '13/A, Kandy Road, Colombo'),
                  buildInfoRow('Birth Weight', '2.5 Kg'),
                  buildInfoRow('Gender', 'Female'),
                  buildInfoRow('Blood group', 'A+'),
                ]),
                buildInfoSection('Mother\'s Information', [
                  buildInfoRow('Mother’s Name', 'Ramani Malkanthi Silva'),
                  buildInfoRow('NIC', '199267483744V'),
                  buildInfoRow('Date of Birth', '1992-06-24'),
                  buildInfoRow('Phone', '071-2345672'),
                  buildInfoRow('Occupation', 'Teacher'),
                ]),
                buildInfoSection('Father\'s Information', [
                  buildInfoRow('Father’s Name', 'Saman Prabath Ranasingha'),
                  buildInfoRow('NIC', '199267483744V'),
                  buildInfoRow('Date of Birth', '1992-11-27'),
                  buildInfoRow('Phone', '071-2345672'),
                  buildInfoRow('Occupation', 'Doctor'),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoSection(String title, List<Widget> children) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            Divider(),
            Column(children: children),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 35, 35, 36),
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}

// class QRCodeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFFCC31A1),
//         title: Text('My QR Code'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Image.asset(
//           'assets/qr.jpeg', // Replace with your image asset path
//           width: 280, // Adjust size as needed
//           height: 280, // Adjust size as needed
//         ),
//       ),
//     );
//   }
// }
