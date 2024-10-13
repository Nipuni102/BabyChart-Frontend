import 'package:babychart/API/token.dart';
import 'package:babychart/myQRCode.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String token = AuthToken().token;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8E42D6),
        title: const Text(
          'BabyChart',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      // Set purple background
      backgroundColor: const Color(0xFF8E42D6),
      body: Column(
        children: [
          // Fixed Profile Header Section
          Container(
            padding: const EdgeInsets.all(20.0),
            color: const Color(0xFF8E42D6), // Same background color as appBar
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/profile_pic.png'),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'K.D. Dhamayanthi',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // QR Code icon
                IconButton(
                  icon: const Icon(Icons.qr_code_2,
                      color: Colors.white, size: 30),
                  onPressed: () {
                    // Navigate to QR Code page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyQRCodeScreen(token: token),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // Scrollable content below the fixed header
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // White box for content
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Profile Image
                            const CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/piumi.png'),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Ranasinghalage Piumi Wathsala Ranasingha',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 35, 35, 36),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),

                            // QR Code Button
                            // ElevatedButton(
                            //   onPressed: () {
                            //     if (token.isNotEmpty) {
                            //       Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //           builder: (context) =>
                            //               MyQRCodeScreen(token: token),
                            //         ),
                            //       );
                            //     } else {
                            //       print('No token found');
                            //     }
                            //   },
                            //   style: ElevatedButton.styleFrom(
                            //     backgroundColor: const Color(0xFFCC31A1),
                            //     foregroundColor: Colors.white,
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(20),
                            //     ),
                            //     padding: const EdgeInsets.symmetric(
                            //         horizontal: 40, vertical: 15),
                            //   ),
                            //   child: const Text(
                            //     'My QR Code',
                            //     style: TextStyle(
                            //       fontSize: 18,
                            //     ),
                            //   ),
                            // ),
                            const SizedBox(height: 20),

                            // Child Information Section
                            buildInfoSection('Child Information', [
                              buildInfoRow('Date of Birth', '2021.10.08'),
                              buildInfoRow('District', 'Gampaha'),
                              buildInfoRow(
                                  'Address', '13/A, Kandy Road, Colombo'),
                              buildInfoRow('Birth Weight', '2.5 Kg'),
                              buildInfoRow('Gender', 'Female'),
                              buildInfoRow('Blood group', 'A+'),
                            ]),

                            // Mother's Information Section
                            buildInfoSection('Mother\'s Information', [
                              buildInfoRow(
                                  'Mother’s Name', 'Ramani Malkanthi Silva'),
                              buildInfoRow('NIC', '199267483744V'),
                              buildInfoRow('Date of Birth', '1992-06-24'),
                              buildInfoRow('Phone', '071-2345672'),
                              buildInfoRow('Occupation', 'Teacher'),
                            ]),

                            // Father's Information Section
                            buildInfoSection('Father\'s Information', [
                              buildInfoRow(
                                  'Father’s Name', 'Saman Prabath Ranasingha'),
                              buildInfoRow('NIC', '199267483744V'),
                              buildInfoRow('Date of Birth', '1992-11-27'),
                              buildInfoRow('Phone', '071-2345672'),
                              buildInfoRow('Occupation', 'Doctor'),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build info sections
  Widget buildInfoSection(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(16), // Padding inside the card
        decoration: BoxDecoration(
          color: const Color(0xFFF292DD)
              .withOpacity(0.5), // Light gray background color
          borderRadius: BorderRadius.circular(15), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0)
                  .withOpacity(0.1), // Slight shadow for depth
              blurRadius: 6,
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8E42D6), // Text color
              ),
            ),
            const Divider(),
            Column(children: children),
          ],
        ),
      ),
    );
  }

  // Helper function to build individual info rows
  Widget buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF4A148C),
            ),
          ),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black87,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}

// QR Code screen
// class MyQRCodeScreen extends StatelessWidget {
//   final String token;

//   const MyQRCodeScreen({super.key, required this.token});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF8E42D6),
//         title: const Text(
//           'My QR Code',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         iconTheme: const IconThemeData(
//           color: Colors.white, // White icon color
//         ),
//       ),
//       // Add a gradient background for a visually appealing effect
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 255, 255, 255),
//               Color.fromARGB(255, 255, 255, 255)
//             ], // Gradient effect
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Add a title above the QR code
//               const Text(
//                 'My QR Code',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF8E42D6),
//                 ),
//               ),
//               const SizedBox(height: 20), // Space between title and QR code

//               // Add a decorative card around the QR code
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20), // Rounded corners
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 10,
//                       spreadRadius: 5,
//                       offset: const Offset(0, 5), // Shadow effect
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(10), // Rounded image
//                       child: Image.asset(
//                         'assets/qr.jpeg', // Replace with your QR code image path
//                         width: 250,
//                         height: 250,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 30),

//               // Token display with decorative box
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF8E42D6),
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 10,
//                       spreadRadius: 5,
//                       offset: const Offset(0, 5),
//                     ),
//                   ],
//                 ),
//                 child: Text(
//                   'Token: $token',
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
