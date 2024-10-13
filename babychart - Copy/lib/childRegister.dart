import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:babychart/qrCodePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Add this package for QR code generation

import 'child_register_first_page.dart';
import 'child_register_fourth_page.dart';
import 'child_register_second_page.dart';
import 'child_register_third_page.dart';

class ChildRegister extends StatefulWidget {
  const ChildRegister({super.key});

  @override
  _ChildRegisterState createState() => _ChildRegisterState();
}

class _ChildRegisterState extends State<ChildRegister> {
  final PageController _pageController = PageController();
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _hearingController = TextEditingController();
  final _heightController = TextEditingController();
  final _birthWeightController = TextEditingController();
  final _eyeSightController = TextEditingController();
  final _bloodGroupController = TextEditingController();
  final _bmiController = TextEditingController();
  final _childBirthRegNumberController = TextEditingController();
  final _weightController = TextEditingController();
  final _motherIdController = TextEditingController();
  final _midWifeIdController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _dateOfBirthController.dispose();
    _hearingController.dispose();
    _heightController.dispose();
    _birthWeightController.dispose();
    _eyeSightController.dispose();
    _bloodGroupController.dispose();
    _bmiController.dispose();
    _childBirthRegNumberController.dispose();
    _weightController.dispose();
    _motherIdController.dispose();
    _midWifeIdController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_pageController.page! < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      _submitForm();
    }
  }

  void _prevPage() {
    if (_pageController.page! > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        final childData = {
          'name': _nameController.text,
          'dateOfBirth': _dateOfBirthController.text,
          'hearing': _hearingController.text,
          'height': _heightController.text,
          'birthWeight': _birthWeightController.text,
          'eyeSight': _eyeSightController.text,
          'bloodGroup': _bloodGroupController.text,
          'bmi': _bmiController.text,
          'childBirthRegNumber': _childBirthRegNumberController.text,
          'weight': _weightController.text,
          'user_id': _motherIdController.text,
          'midWifeId': _midWifeIdController.text,
        };

        // Generate QR code image data
        final qrCodeImage = await generateQRCodeImage(childData);
        final qrCodeFile = await saveQRCodeImage(qrCodeImage);

        final request = http.MultipartRequest(
          'POST',
          Uri.parse('http://51.20.246.58/children'),
        );

        request.fields.addAll(childData);

        request.files.add(
          await http.MultipartFile.fromPath(
            'qr_code',
            qrCodeFile.path,
            contentType: MediaType('image', 'png'),
          ),
        );

        final response = await request.send();

        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Child registered successfully!')),
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QrCodePage(
                qrData: qrCodeFile.path,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to register child.')),
          );
        }
      } catch (error) {
        // Handle specific error types if needed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: $error')),
        );
      }
    }
  }

  Future<Uint8List> generateQRCodeImage(Map<String, String> data) async {
    final qrData = formatChildData(data);

    final qrPainter = QrPainter(
      data: qrData,
      version: QrVersions.auto,
      gapless: true,
    );

    const size = Size(200.0, 200.0); // Adjust size as needed
    final pictureRecorder = ui.PictureRecorder();
    final canvas = Canvas(pictureRecorder,
        Rect.fromPoints(const Offset(0, 0), size.bottomRight(Offset.zero)));
    qrPainter.paint(canvas, size);

    final picture = pictureRecorder.endRecording();
    final img = await picture.toImage(size.width.toInt(), size.height.toInt());
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  Future<File> saveQRCodeImage(Uint8List imageData) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/qrcode.png';
    final file = File(filePath);
    await file.writeAsBytes(imageData);
    return file;
  }

  String formatChildData(Map<String, String> data) {
    return '''
    Name: ${data['name']}
    Date of Birth: ${data['dateOfBirth']}
    Hearing: ${data['hearing']}
    Height: ${data['height']}
    Birth Weight: ${data['birthWeight']}
    Eye Sight: ${data['eyeSight']}
    Blood Group: ${data['bloodGroup']}
    BMI: ${data['bmi']}
    Child Birth Registration Number: ${data['childBirthRegNumber']}
    Weight: ${data['weight']}
    Mother ID: ${data['user_id']}
    Mid Wife ID: ${data['midWifeId']}
    ''';
  }

  String generateQRCodeData(String formattedData) {
    // Generate a QR code from the formatted data
    // Here, you could return a string representation of the QR code
    // For simplicity, we're just returning the formatted data directly
    // In a real application, you might use a library to generate the actual QR code image
    return formattedData;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ChildRegisterFirstPage(
                nameController: _nameController,
                dateOfBirthController: _dateOfBirthController,
              ),
              ChildRegisterSecondPage(
                hearingController: _hearingController,
                heightController: _heightController,
                birthWeightController: _birthWeightController,
                eyeSightController: _eyeSightController,
                bloodGroupController: _bloodGroupController,
                bmiController: _bmiController,
              ),
              ChildRegisterThirdPage(
                childBirthRegNumberController: _childBirthRegNumberController,
                weightController: _weightController,
                motherIdController: _motherIdController,
                midWifeIdController: _midWifeIdController,
              ),
              ChildRegisterFourthPage(
                submitForm: _submitForm,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: _prevPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  'Back',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
