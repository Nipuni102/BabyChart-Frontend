import 'package:babychart/auth/auth_service.dart';
import 'package:babychart/selectChild.dart';
import 'package:babychart/theme/app_decorations.dart';
import 'package:babychart/theme/custom_text_style.dart';
import 'package:babychart/theme/theme_helper.dart';
import 'package:babychart/widgets/custom_elevated_button.dart';
import 'package:babychart/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // EmailController removed as it's not required anymore

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF67418C),
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: 450,
            child: SingleChildScrollView(
              child: SizedBox(
                height: 840,
                width: 450,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 140,
                        ),
                        decoration: AppDecoration.fillwhiteA.copyWith(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildUsernameSection(context),
                            const SizedBox(height: 10),
                            _buildPasswordSection(context),
                            const SizedBox(height: 10),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 64,
                              width: 236,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CustomElevatedButton(
                                    width: 236,
                                    height: 100,
                                    text: "Sign Up",
                                    onPressed: () {
                                      onTapSignUp(context);
                                    },
                                    alignment: Alignment.center,
                                    buttonStyle: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        const Color(0xFF67418C),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              15.0), // Adjust radius as needed
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),

                            const SizedBox(height: 20),
                            _buildAlreadyHaveAccountSection(
                                context), // Added Login section here
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
              "Mobile Number",
              style: CustomTextStyles.titleLargeMulish,
            ),
          ),
          const SizedBox(height: 7),
          OutlineGradientButton(
            padding: const EdgeInsets.only(
              left: 1,
              top: 1,
              right: 1,
              bottom: 1,
            ),
            strokeWidth: 1,
            gradient: LinearGradient(
              begin: const Alignment(0.5, 0),
              end: const Alignment(0.5, 1),
              colors: [
                appTheme.purple40001,
                theme.colorScheme.secondaryContainer
              ],
            ),
            corners: const Corners(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: CustomTextFormField(
              controller: userNameController,
              hintText: "Phone number",
            ),
          )
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
              padding: const EdgeInsets.only(
                left: 1,
                top: 1,
                right: 1,
                bottom: 1,
              ),
              strokeWidth: 1,
              gradient: LinearGradient(
                begin: const Alignment(0.5, 0),
                end: const Alignment(0.5, 1),
                colors: [appTheme.purple40001, appTheme.blueA200],
              ),
              corners: const Corners(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: CustomTextFormField(
                controller: passwordController,
                hintText: "Password",
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.visiblePassword,
                obscureText: true,
                borderDecoration: TextFormFieldStyleHelper.outlineTL15,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAlreadyHaveAccountSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account?",
          style:
              TextStyle(color: Color.fromARGB(255, 37, 37, 37), fontSize: 16),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
                context, '/signIn'); // Navigate to the login page
          },
          child: const Text(
            "Log in",
            style: TextStyle(
              color: Color(0xFF67418C),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginImageStack(BuildContext context) {
    return Stack(
      fit: StackFit.expand, // Ensure the Stack fills the parent
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image(
            image: const AssetImage('assets/signup.png'),
            width: MediaQuery.of(context).size.width,
          ),
        ),
        const Positioned(
          top: 300, // Adjust the fraction as needed
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 44, // Adjust the font size as needed
                fontWeight: FontWeight.bold, // Make the text bold
                color: Color(0xFF67418C), // Set the text color
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 50, // Adjust position as needed
          left: 0,
          right: 0,
          child: Center(
            child: TextButton(
              onPressed: () {
                // Navigate to login page or perform another action
                // Navigator.push(...);
              },
              child: const Text(
                "Already have an account? Login",
                style: TextStyle(
                  color: Colors.white, // Change this to your desired color
                  decoration: TextDecoration.none, // Remove underline
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void onTapSignUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await authService.register(
          userNameController.text,
          'lahirusashika@gmail4.com', // Default email passed here
          passwordController.text,
          passwordController.text,
        );
        final token = response['data']['token'] ?? '';
        print(token);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectChild(token: token),
          ),
        );
        print('Registration Successful: ${response['message']}');
      } catch (e) {
        print('Registration Failed: $e');
      }
    }
  }
}
