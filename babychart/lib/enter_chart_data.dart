import 'dart:io';

import 'package:babychart/enter_w&h.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class EnterChartData extends StatefulWidget {
  const EnterChartData({super.key});

  @override
  _EnterChartDataScreenState createState() => _EnterChartDataScreenState();
}

class _EnterChartDataScreenState extends State<EnterChartData> {
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
        backgroundColor: Color(0xFF654089),
        title: const Text(
          'BabyChart',
          style: TextStyle(color: Colors.white), // Set title color to black
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
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
            const Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'assets/profile_pic.png'), // Replace with your image path
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
            const SizedBox(height: 20),
            // Enter Vaccination Title
            const Text(
              'Enter chart Data',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 20),
            // Scan QR Code Section
            // const Text(
            //   'Scan your QR Code',
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.purple,
            //   ),
            // ),
            const SizedBox(height: 20),
            Expanded(
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            const SizedBox(height: 20),
            // Scan QR Code Button
            // ElevatedButton.icon(
            //   onPressed: () {
            //     controller
            //         ?.resumeCamera(); // Resume the camera if it was paused
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Color(0xFF654089),
            //     foregroundColor: Colors.white,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            //   ),
            //   // icon: const Icon(Icons.qr_code_scanner),
            //   label: const Text(
            //     'Scan QR Code',
            //     style: TextStyle(
            //       fontSize: 18,
            //     ),
            //   ),
            // ),
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
            builder: (context) => EnterWH(scannedData: scannedData)),
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
