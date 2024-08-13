import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For jsonEncode

class EnterBatchNo extends StatefulWidget {
  final String? scannedData;

  EnterBatchNo({Key? key, required this.scannedData}) : super(key: key);

  @override
  _EnterBatchNoState createState() => _EnterBatchNoState();
}

class _EnterBatchNoState extends State<EnterBatchNo> {
  final TextEditingController _batchNoController = TextEditingController();
  final TextEditingController _childIdController = TextEditingController();
  String? _selectedVaccine;

  void _showSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Data entered successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

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
          DateTime.now().add(Duration(days: 30)).toIso8601String(),
      'child_id': int.parse(childId) // Convert the child ID to integer
    };

    try {
      final response = await http.post(
        Uri.parse('http://51.20.246.58/vaccines'),
        headers: {
          'Content-Type': 'application/json',
          // Add other headers if needed
        },
        body: jsonEncode(data),
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 201) {
        _showSuccessMessage(context);
      } else {
        _showErrorMessage(context, 'Failed to submit data: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
      _showErrorMessage(context, 'An error occurred: $error');
    }
  }

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
        backgroundColor: Colors.pink,
        title: Text(
          'BabyChart',
          style: TextStyle(color: Colors.white), // Set title color to black
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Handle back button press
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
                  backgroundImage: AssetImage('assets/midwife.png'), // Replace with your image path
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
            SizedBox(height: 20),
            // Enter Vaccination Title
            Text(
              'Enter Vaccination',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 20),
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
              ),
            ),
            SizedBox(height: 20),
            // Display the scanned QR code data
            if (widget.scannedData != null)
              Card(
                color: Colors.pink[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(20),
                  title: Text(
                    'Scanned Data',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    widget.scannedData!,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            SizedBox(height: 20),
            // Batch No TextField
            TextField(
              controller: _batchNoController,
              decoration: InputDecoration(
                labelText: 'Batch No',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Child ID TextField
            TextField(
              controller: _childIdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Child ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Enter Data Button
            ElevatedButton(
              onPressed: _submitData,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
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
