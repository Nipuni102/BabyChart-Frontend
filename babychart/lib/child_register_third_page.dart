import 'package:flutter/material.dart';

class ChildRegisterThirdPage extends StatelessWidget {
  final TextEditingController childBirthRegNumberController;
  final TextEditingController weightController;
  final TextEditingController motherIdController;
  final TextEditingController midWifeIdController;

  ChildRegisterThirdPage({
    required this.childBirthRegNumberController,
    required this.weightController,
    required this.motherIdController,
    required this.midWifeIdController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Additional Information'),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(childBirthRegNumberController,
                'Child Birth Registration Number', 'Enter registration number',
                required: false),
            _buildTextField(weightController, 'Weight', 'Enter weight',
                keyboardType: TextInputType.number, required: false),
            _buildTextField(
                motherIdController, 'Mother ID', 'Enter mother\'s ID'),
            _buildTextField(
                midWifeIdController, 'Mid Wife ID', 'Enter midwife\'s ID'),
          ],
        ),
      ),
    );
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
