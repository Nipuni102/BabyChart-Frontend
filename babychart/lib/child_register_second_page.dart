import 'package:flutter/material.dart';

class ChildRegisterSecondPage extends StatelessWidget {
  final TextEditingController hearingController;
  final TextEditingController heightController;
  final TextEditingController birthWeightController;
  final TextEditingController eyeSightController;
  final TextEditingController bloodGroupController;
  final TextEditingController bmiController;

  ChildRegisterSecondPage({
    required this.hearingController,
    required this.heightController,
    required this.birthWeightController,
    required this.eyeSightController,
    required this.bloodGroupController,
    required this.bmiController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
          'Health Information',
          style: TextStyle(color: Colors.white), // Set title color to black
        ),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(
                  hearingController, 'Hearing', 'Enter hearing details',
                  required: false),
              _buildTextField(heightController, 'Height', 'Enter height',
                  keyboardType: TextInputType.number, required: false),
              _buildTextField(
                  birthWeightController, 'Birth Weight', 'Enter birth weight',
                  keyboardType: TextInputType.number, required: false),
              _buildTextField(
                  eyeSightController, 'Eye Sight', 'Enter eye sight details',
                  required: false),
              _buildTextField(
                  bloodGroupController, 'Blood Group', 'Enter blood group',
                  required: false),
              _buildTextField(bmiController, 'BMI', 'Enter BMI',
                  keyboardType: TextInputType.number, required: false),
            ],
          ),
        ));
  }

  Widget _buildTextField(
      TextEditingController controller, String label, String hint,
      {bool required = true, TextInputType keyboardType = TextInputType.text}) {
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
