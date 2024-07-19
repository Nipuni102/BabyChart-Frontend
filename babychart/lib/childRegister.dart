import 'dart:convert';

import 'package:babychart/qrCodePage.dart';
import 'package:babychart/theme/app_decorations.dart';
import 'package:babychart/theme/custom_text_style.dart';
import 'package:babychart/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChildRegister extends StatefulWidget {
  const ChildRegister({Key? key}) : super(key: key);

  @override
  _ChildRegisterState createState() => _ChildRegisterState();
}

class _ChildRegisterState extends State<ChildRegister> {
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

void _submitForm() async {
  if (_formKey.currentState!.validate()) {
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

    final response = await http.post(
      Uri.parse('http://51.20.246.58/children'), // Replace with your actual endpoint
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(childData),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Child registered successfully!')),
      );
      final formattedData = formatChildData(childData);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QrCodePage(
              qrData: formattedData, // Pass the formatted data to generate QR code
            ),
          ),
        );
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to register child.')),
      );
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                _buildRegisterSelection(context),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 29,
                    vertical: 50,
                  ),
                  decoration: AppDecoration.gradientPurpleToPurple,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextField(_nameController, 'Name', 'Enter child\'s name'),
                        _buildTextField(_dateOfBirthController, 'Date of Birth', 'Enter date of birth'),
                        _buildTextField(_hearingController, 'Hearing', 'Enter hearing details', required: false),
                        _buildTextField(_heightController, 'Height', 'Enter height', keyboardType: TextInputType.number, required: false),
                        _buildTextField(_birthWeightController, 'Birth Weight', 'Enter birth weight', keyboardType: TextInputType.number, required: false),
                        _buildTextField(_eyeSightController, 'Eye Sight', 'Enter eye sight details', required: false),
                        _buildTextField(_bloodGroupController, 'Blood Group', 'Enter blood group', required: false),
                        _buildTextField(_bmiController, 'BMI', 'Enter BMI', keyboardType: TextInputType.number, required: false),
                        _buildTextField(_childBirthRegNumberController, 'Child Birth Registration Number', 'Enter registration number', required: false),
                        _buildTextField(_weightController, 'Weight', 'Enter weight', keyboardType: TextInputType.number, required: false),
                        _buildTextField(_motherIdController, 'user_id ID', 'Enter mother\'s ID'),
                        _buildTextField(_midWifeIdController, 'Mid Wife ID', 'Enter midwife\'s ID'),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: _submitForm,
                            child: const Text('Register Child'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterSelection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 34.5,
        horizontal: 40.0,
      ),
      color: const Color(0xFFDF32B9),
      child: Column(
        children: [
          const SizedBox(height: 31),
          const Text(
            'Child Register',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, String hint, {bool required = true, TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
        validator: (value) {
          if (required && (value == null || value.isEmpty)) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}
