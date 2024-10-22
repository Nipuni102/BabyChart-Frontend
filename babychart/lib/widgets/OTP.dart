import 'package:babychart/selectChild.dart'; // Assuming this is the next screen after OTP
import 'package:babychart/signInPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTP Verification',
      home:
          OtpScreen(token: 'dummy_token'), // Passing a dummy token for testing
    );
  }
}

class OtpScreen extends StatefulWidget {
  final String token; // Token passed from SignInPage

  OtpScreen({required this.token});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  final TextEditingController _thirdController = TextEditingController();
  final TextEditingController _fourthController = TextEditingController();

  final FocusNode _firstFocusNode = FocusNode();
  final FocusNode _secondFocusNode = FocusNode();
  final FocusNode _thirdFocusNode = FocusNode();
  final FocusNode _fourthFocusNode = FocusNode();

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _fourthController.dispose();
    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF67418C),
      appBar: AppBar(
        backgroundColor: Color(0xFF67418C),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Use pop to go back to previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title positioned outside the white box
              Center(
                child: Text(
                  'BabyChart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 80),
              // White box container
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OTP Verification',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Enter the verification code we just sent to your email address',
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _otpTextField(_firstController, _firstFocusNode,
                            _secondFocusNode),
                        _otpTextField(_secondController, _secondFocusNode,
                            _thirdFocusNode),
                        _otpTextField(_thirdController, _thirdFocusNode,
                            _fourthFocusNode),
                        _otpTextField(
                            _fourthController, _fourthFocusNode, null),
                      ],
                    ),
                    SizedBox(height: 50),
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            _verifyOtp(context); // OTP verification logic
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFF67418C), // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Verify',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 80),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Navigate to LoginScreen when pressed
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()),
                          );
                        },
                        child: Text(
                          'Already have an account? Login',
                          style: TextStyle(color: Color(0xFF67418C)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _otpTextField(TextEditingController controller, FocusNode currentFocus,
      FocusNode? nextFocus) {
    return Container(
      width: 50,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        onChanged: (value) {
          if (value.length == 1) {
            // Move to next input field if there is one
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            } else {
              currentFocus.unfocus(); // Dismiss the keyboard on last input
            }
          }
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
        style: TextStyle(
          fontSize: 24,
          color: Colors.black,
        ),
      ),
    );
  }

  // Method to verify the OTP
  void _verifyOtp(BuildContext context) {
    String otp = _firstController.text +
        _secondController.text +
        _thirdController.text +
        _fourthController.text;

    if (otp == '1234') {
      // Dummy OTP validation
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => SelectChild(
                token: widget.token)), // Navigate to the next screen
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid OTP')),
      );
    }
  }
}
