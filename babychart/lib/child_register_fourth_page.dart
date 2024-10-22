import 'package:flutter/material.dart';

class ChildRegisterFourthPage extends StatelessWidget {
  final VoidCallback submitForm;

  const ChildRegisterFourthPage({super.key, required this.submitForm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Review and Submit', // Corrected the typo
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF654089),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 170),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF654089),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    foregroundColor:
                        Colors.white, // Correct way to set text color
                  ),
                  child: const Text('Submit'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
