import 'package:babychart/qrCodePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'child_register_first_page.dart';
import 'child_register_second_page.dart';
import 'child_register_third_page.dart';
import 'child_register_fourth_page.dart';

class ChildRegister extends StatefulWidget {
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
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      _submitForm();
    }
  }

  void _prevPage() {
    if (_pageController.page! > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
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
        Uri.parse('http://51.20.246.58/children'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(childData),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Child registered successfully!')),
        );

        final formattedData = formatChildData(childData);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QrCodePage(
              qrData: formattedData,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to register child.')),
        );
      }
    }
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
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
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
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
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
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
