import 'package:babychart/auth/mid_auth_service.dart';
import 'package:babychart/theme/app_decorations.dart';
import 'package:babychart/theme/custom_text_style.dart';
import 'package:babychart/widgets/custom_checkbox_button.dart';
import 'package:babychart/widgets/custom_elevated_button.dart';
import 'package:babychart/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class MidSignInPage extends StatelessWidget {
  MidSignInPage({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMeCheckbox = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final MidAuthService _authService = MidAuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Applying a linear gradient to the entire background of the page
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFB16FEF),
                Color(0xFF651850),
                Color(0xFF651850),
                Color(0xFF651850)
              ], // Example gradient colors
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: 420,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 880,
                  width: 390,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 23,
                            vertical: 90,
                          ),
                          decoration: AppDecoration.fillwhiteA.copyWith(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildUsernameSection(context),
                              const SizedBox(height: 10),
                              _buildPasswordSection(context),
                              const SizedBox(height: 17),
                              _buildRememberMeCheckbox(context),
                              const SizedBox(height: 15),
                              _buildSignInButton(context),
                              const SizedBox(height: 15),
                              Text(
                                "Forget password?",
                                style: CustomTextStyles.titleMediumGreen400,
                              ),
                              const SizedBox(height: 15),
                              // Add GestureDetector for sign-up navigation
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/midSignUp');
                                },
                                child: Text(
                                  "Don’t have an account? Sign Up",
                                  style: CustomTextStyles.titleMediumGreen400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      _buildLoginImageStack(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUsernameSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 7),
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 1),
            child: Text(
              "User Name",
              style: CustomTextStyles.titleLargeMulish,
            ),
          ),
          const SizedBox(height: 7),
          OutlineGradientButton(
            padding: const EdgeInsets.all(1),
            strokeWidth: 1,
            gradient: const LinearGradient(
              colors: [
                Color(0xFF8E42D6),
                Color(0xFFCC31A1)
              ], // Example gradient colors for the field
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            radius: const Radius.circular(15),
            child: CustomTextFormField(
              controller: userNameController,
              hintText: "Username",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 3),
            child: Text(
              "Password",
              style: CustomTextStyles.titleLargeMulish,
            ),
          ),
          const SizedBox(height: 9),
          Padding(
            padding: const EdgeInsets.only(right: 7),
            child: OutlineGradientButton(
              padding: const EdgeInsets.all(1),
              strokeWidth: 1,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF8E42D6),
                  Color(0xFFCC31A1)
                ], // Gradient for the password field
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              radius: const Radius.circular(15),
              child: CustomTextFormField(
                controller: passwordController,
                hintText: "Password",
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.visiblePassword,
                obscureText: true,
                borderDecoration: TextFormFieldStyleHelper.outlineTL15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRememberMeCheckbox(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 7),
        child: CustomCheckboxButton(
          alignment: Alignment.centerLeft,
          text: "Remember Me",
          value: rememberMeCheckbox,
          onChange: (value) {
            rememberMeCheckbox = value;
          },
        ),
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 236,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                "Sign In",
                style: CustomTextStyles.titleLargePoppinsWhiteA70001,
              ),
            ),
          ),
          CustomElevatedButton(
            width: 236,
            height: 80,
            text: "Login",
            onPressed: () {
              onTapLogin(context);
            },
            alignment: Alignment.center,
            buttonStyle: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xFF654089), // Background color
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14), // Border radius
                  side: const BorderSide(
                    color: Color(0xFF654089), // Border color
                    width: 2.0, // Border width
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginImageStack(BuildContext context) {
    return Stack(
      fit: StackFit.expand, // Ensure the Stack fills the parent
      children: [
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: Image(
            image: const AssetImage('assets/midSignIn.png'),
            width: MediaQuery.of(context).size.width,
          ),
        ),
        const Positioned(
          top: 200, // Adjust the fraction as needed
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 44, // Adjust the font size as needed
                fontWeight: FontWeight.bold, // Make the text bold
                color: Color(0xFFDF32B9), // Set the text color
              ),
            ),
          ),
        ),
      ],
    );
  }

  void onTapLogin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await _authService.login(
          userNameController.text,
          passwordController.text,
        );
        Navigator.pushNamed(context, '/midHome');
        print('Login Successful: ${response['message']}');
      } catch (e) {
        // Handle error (e.g., show error message)
        print('Login Failed: $e');
      }
    }
  }
}
