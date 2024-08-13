import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:babychart/enter_Batch_No.dart';

class EnterVaccination extends StatefulWidget {
  @override
  _EnterVaccinationScreenState createState() => _EnterVaccinationScreenState();
}

class _EnterVaccinationScreenState extends State<EnterVaccination> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? scannedData;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Profile Information
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'assets/midwife.png'), // Replace with your image path
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
              items: ['Select Vaccine', 'Triple', 'MMR', 'Rubella']
                  .map((String value) {
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
            // Scan QR Code Section
            Text(
              'Scan your QR Code',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            SizedBox(height: 20),
            // Scan QR Code Button
            ElevatedButton.icon(
              onPressed: () {
                controller
                    ?.resumeCamera(); // Resume the camera if it was paused
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              icon: Icon(Icons.qr_code_scanner),
              label: Text(
                'Scan QR Code',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            // Display Scanned Data if available
            if (scannedData != null) ...[
              // SizedBox(height: 20),
              // Text(
              //   'Scanned Data: $scannedData',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.green,
              //   ),
              // ),
            ],
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        scannedData = scanData.code;
      });
      print('Scanned data: $scannedData');
      // Navigate to EnterBatchNo page after scanning the QR code
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EnterBatchNo(scannedData: scannedData)),
      );
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }
}
