import 'package:flutter/material.dart';

class ChildRegisterFourthPage extends StatelessWidget {
  final VoidCallback submitForm;

  ChildRegisterFourthPage({required this.submitForm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Review and Submit'),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ));
  }
}
