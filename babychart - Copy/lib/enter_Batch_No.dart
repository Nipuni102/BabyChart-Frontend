import 'dart:convert'; // For jsonEncode

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EnterBatchNo extends StatefulWidget {
  final String? scannedData;

  const EnterBatchNo({super.key, required this.scannedData});

  @override
  _EnterBatchNoState createState() => _EnterBatchNoState();
}

class _EnterBatchNoState extends State<EnterBatchNo> {
  final TextEditingController _batchNoController = TextEditingController();
  final TextEditingController _childIdController = TextEditingController();
  String? _selectedVaccine;

  // Method to display success message
  void _showSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data entered successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Method to handle data submission
  Future<void> _submitData() async {
    final batchNo = _batchNoController.text;
    final vaccine = _selectedVaccine;
    final scannedData = widget.scannedData;
    final childId = _childIdController.text;

    if (batchNo.isEmpty || vaccine == null || childId.isEmpty) {
      _showErrorMessage(context, 'Please fill all fields.');
      return;
    }

    final data = {
      'name': vaccine,
      'vaccinated_date': DateTime.now().toIso8601String(),
      'batch_no': batchNo,
      'adverse_effects': 'None',
      'age_to_be_vaccinated':
          DateTime.now().add(const Duration(days: 30)).toIso8601String(),
      'child_id': int.parse(childId) // Convert the child ID to integer
    };

    try {
      final response = await http.post(
        Uri.parse('http://51.20.246.58/vaccines'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        _showSuccessMessage(context);
      } else {
        _showErrorMessage(context, 'Failed to submit data: ${response.body}');
      }
    } catch (error) {
      _showErrorMessage(context, 'An error occurred: $error');
    }
  }

  // Method to display error message
  void _showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8E42D6),
        title: const Text(
          'BabyChart',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Profile Information
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'assets/profile_pic.png'), // Replace with your image path
                ),
                const SizedBox(width: 10),
                const Text(
                  'G.H.K. Wijerathna',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Enter Vaccination Title
            const Text(
              'Enter Vaccination',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 20),
            // Dropdown for Vaccine Selection
            DropdownButtonFormField<String>(
              value: _selectedVaccine,
              items: ['Triple', 'MMR', 'Rubella'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedVaccine = newValue;
                });
              },
              decoration: InputDecoration(
                labelText: 'Vaccination',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Color.fromARGB(137, 177, 111, 239),
              ),
            ),
            const SizedBox(height: 20),
            // Display the scanned QR code data
            if (widget.scannedData != null)
              Card(
                color: Color(0xFFF292DD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    // Image at the top
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                            'assets/child.png'), // Replace with your image path or use NetworkImage for an online image
                      ),
                    ),
                    // Text section for scanned data
                    ListTile(
                      contentPadding: const EdgeInsets.all(20),
                      // title: const Text(
                      //   'Scanned Data',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.bold,
                      //     textAlign:
                      //         TextAlign.center, // Centering the title text
                      //   ),
                      // ),
                      subtitle: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.center, // Center the content
                        children: const [
                          Text(
                            'Piumi Wathsala',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 5), // Space between name and age
                          Text(
                            ' 3 Months',
                            style: TextStyle(
                              color: Color.fromARGB(255, 44, 44, 44),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 20),
            // Batch No TextField
            TextField(
              controller: _batchNoController,
              decoration: InputDecoration(
                labelText: 'Batch No',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true, // Enable filling background
                fillColor: Color.fromARGB(137, 177, 111, 239),
              ),
            ),
            const SizedBox(height: 20),
            // Child ID TextField
            TextField(
              controller: _childIdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Child ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true, // Enable filling background
                fillColor: Color.fromARGB(137, 177, 111, 239),
              ),
            ),
            const SizedBox(height: 20),
            // Enter Data Button
            ElevatedButton(
              onPressed: _submitData,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8E42D6),
                foregroundColor: Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                'Enter Data',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _batchNoController.dispose();
    _childIdController.dispose();
    super.dispose();
  }
}
