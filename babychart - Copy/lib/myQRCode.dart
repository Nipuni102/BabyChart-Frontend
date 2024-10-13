import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyQRCodeScreen extends StatelessWidget {
  final String token;

  const MyQRCodeScreen({super.key, required this.token});

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
        backgroundColor: const Color(0xFF8E42D6),
        title: const Text(
          'My QR Code',
          style: TextStyle(color: Colors.white), // Set title color to white
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white, // Set back arrow color to white
        ),
      ),
      body: FutureBuilder<Map<String, String>>(
        future: fetchQRCode(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No QR Code Available'));
          }

          final qrCode = snapshot.data!['qr_code']!;
          final childId = snapshot.data!['child_id']!;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Add a title above the QR code
                const Text(
                  'My QR Code',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8E42D6),
                  ),
                ),
                const SizedBox(height: 10),

                // Child ID displayed above QR code

                const SizedBox(height: 20),

                // QR Code display inside a card-like container
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Image.network(
                    'http://51.20.246.58/storage/qr_codes/$qrCode', // Adjust URL based on your setup
                    width: 280, // Adjust size as needed
                    height: 280, // Adjust size as needed
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text('Failed to load QR Code');
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Child ID: $childId',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
