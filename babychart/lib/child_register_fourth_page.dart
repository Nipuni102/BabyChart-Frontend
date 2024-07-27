import 'package:flutter/material.dart';

class ChildRegisterFourthPage extends StatelessWidget {
  final VoidCallback submitForm;

  ChildRegisterFourthPage({required this.submitForm});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Review and Submit', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: submitForm,
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
