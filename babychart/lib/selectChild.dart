import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SelectChild extends StatefulWidget {
  final String token;

  const SelectChild({super.key, required this.token});

  @override
  _SelectChildState createState() => _SelectChildState();
}

class _SelectChildState extends State<SelectChild> {
  Future<Map<String, dynamic>> fetchUserDetails() async {
    final response = await http.get(
      Uri.parse('http://51.20.246.58/user'),
      headers: {
        'Authorization': 'Bearer ${widget.token}',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Header and Profile Picture
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Color(0xFF8E42D6),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(0.0),
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/profile_pic.png'),
                      radius: 30,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hello, Geetha Fernando!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.notifications, color: Colors.white),
                  ],
                ),
              ),

              // White box for Upcoming Clinic Day
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Frame.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Upcoming Clinic Day',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Icon(Icons.calendar_today,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        SizedBox(width: 8),
                        Text(
                          'Sunday, 23 Jan',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Icon(Icons.access_time,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        SizedBox(width: 8),
                        Text(
                          '08:00 a.m',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Icon(Icons.location_on,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        SizedBox(width: 8),
                        Text(
                          'Maravila',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Children List Title
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Children List',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF67418C),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Horizontal scrollable Children List
              FutureBuilder<Map<String, dynamic>>(
                future: fetchUserDetails(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    var user = snapshot.data!;
                    return _buildHorizontalChildrenList(context, user);
                  } else {
                    return const Text('No data available');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalChildrenList(
      BuildContext context, Map<String, dynamic> user) {
    List<dynamic> children = user['data']['children'] ?? [];

    return SizedBox(
      height: 400, // Fixed height for the child card container
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Enable horizontal scrolling
        itemCount: children.length,
        itemBuilder: (context, index) {
          return _buildChildCard(context, children[index]);
        },
      ),
    );
  }

  Widget _buildChildCard(BuildContext context, Map<String, dynamic> child) {
    return GestureDetector(
      onTap: () {
        onTapProfileSection(context, child);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width * 0.45, // Adjust card width
        decoration: BoxDecoration(
          color: Color(0xFFD2A6FB),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 158, 158, 158).withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // Shadow effect
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                child['id']?.toString() == '48'
                    ? 'assets/child.png'
                    : 'assets/child1.png',
                // Child image placeholder
                width: 150,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    child['id']?.toString() == '48'
                        ? 'Kivein Vinuk'
                        : 'Neksha Mevi',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 14, 14, 14),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    child['age'] ?? '2 months',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 82, 82, 82),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    child['dob'] ?? 'september 1, 2024',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 82, 82, 82),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTapProfileSection(BuildContext context, Map<String, dynamic> child) {
    Navigator.pushNamed(
      context,
      '/nav',
      arguments: {
        'token': widget.token,
        'child': child,
      }, // Pass child data as arguments
    );
  }
}
