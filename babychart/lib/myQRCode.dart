import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyQRCodeScreen extends StatelessWidget {
  final String token;

  MyQRCodeScreen({required this.token});

  Future<Map<String, String>> fetchQRCode() async {
    final response = await http.get(
      Uri.parse('http://51.20.246.58/user'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      final children = data['children'] as List<dynamic>;
      for (var child in children) {
        if (child['qr_code'] != null) {
          return {
            'qr_code': child['qr_code'],
            'child_id': child['id'].toString(),
          };
        }
      }
      throw Exception('No QR code found');
    } else {
      throw Exception('Failed to load user details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFCC31A1),
        title: Text(
          'My QR Code',
          style: TextStyle(color: Colors.white), // Set title color to black
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, // Set back arrow color to white
        ),
      ),
      body: FutureBuilder<Map<String, String>>(
        future: fetchQRCode(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No QR Code Available'));
          }

          final qrCode = snapshot.data!['qr_code']!;
          final childId = snapshot.data!['child_id']!;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Child ID: $childId',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Image.network(
                  'http://51.20.246.58/storage/qr_codes/$qrCode', // Adjust URL based on your setup
                  width: 280, // Adjust size as needed
                  height: 280, // Adjust size as needed
                  fit: BoxFit.cover,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
