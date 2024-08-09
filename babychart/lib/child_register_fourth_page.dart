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
            SizedBox(height: 170),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submitForm,
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),);
  }
}
