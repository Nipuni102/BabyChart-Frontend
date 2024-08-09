import 'package:flutter/material.dart';

class EnterBatchNo extends StatefulWidget {
  final String? scannedData;

  EnterBatchNo({Key? key, required this.scannedData}) : super(key: key);

  @override
  _EnterBatchNoState createState() => _EnterBatchNoState();
}

class _EnterBatchNoState extends State<EnterBatchNo> {
  final TextEditingController _batchNoController = TextEditingController();

  void _showSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Data entered successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

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
                  backgroundImage: AssetImage('assets/images/profile_picture.png'), // Replace with your image path
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
              value: 'Select Vaccine',
              items: ['Select Vaccine', 'Triple', 'MMR', 'Rubella'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                // Handle vaccine selection
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
            // Enter Data Button
            ElevatedButton(
              onPressed: () {
                // Handle Enter Data button press
                _showSuccessMessage(context);
              },
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
    super.dispose();
  }
}
