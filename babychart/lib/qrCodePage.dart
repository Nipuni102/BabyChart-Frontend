import 'package:babychart/MidHome.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

class QrCodePage extends StatelessWidget {
  final String qrData;

  const QrCodePage({Key? key, required this.qrData}) : super(key: key);

  Future<void> _navigateToNextPage(BuildContext context) async {
    try {
      final qrPainter = QrPainter(
        data: qrData,
        version: QrVersions.auto,
        gapless: false,
      );

      // Render the QR code to an image
      final ui.Picture picture = qrPainter.toPicture(2);
      final ui.Image image = await picture.toImage(200, 200); // Specify desired width and height
      final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Navigate to the next page and pass the image data
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MidHome(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to generate QR Code: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.pink,
        title: Text('QR Code'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: qrData,
              version: QrVersions.auto,
              size: 200.0,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToNextPage(context),
              child: Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
