import 'package:babychart/theme/custom_text_style.dart';
import 'package:babychart/theme/theme_helper.dart';
import 'package:babychart/widgets/custom_elevated_button.dart';
import 'package:babychart/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class MidSignUpPage extends StatelessWidget {
  MidSignUpPage({super.key});
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController EmailController = TextEditingController();

  bool rememberMeCheckbox = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFB16FEF),
                Color(0xFF651850),
                Color(0xFF651850),
                Color(0xFF651850),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 900,
                  width: 390,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 23,
                            vertical: 103,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildUsernameSection(context),
                              const SizedBox(height: 8),
                              _buildPasswordSection(context),
                              const SizedBox(height: 8),
                              _buildEmailSection(context),
                              const SizedBox(height: 7),
                              SizedBox(
                                height: 64,
                                width: 236,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CustomElevatedButton(
                                      width: 236,
                                      text: "Sign Up",
                                      onPressed: () {
                                        onTapLogin(context);
                                      },
                                      alignment: Alignment.center,
                                      buttonStyle: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          const Color(0xFF654089),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 1),
                              _buildLoginOptionsRow(context),
                              const SizedBox(height: 1),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 57,
                                    width: 73,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 22,
                                      vertical: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Image(
                                      image: AssetImage('assets/facebook.png'),
                                    ),
                                  ),
                                  Container(
                                    height: 57,
                                    width: 73,
                                    margin: const EdgeInsets.only(left: 45),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 22,
                                      vertical: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Image(
                                      image: AssetImage('assets/google.png'),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
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
              hintText: "Username",
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget

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

  Widget _buildEmailSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 7),
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 1),
            child: Text(
              "Email",
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
              controller: EmailController,
              hintText: "Email",
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget

  Widget _buildLoginOptionsRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 9,
              bottom: 13,
            ),
            child: SizedBox(
              width: 87,
              child: Divider(),
            ),
          ),
          Text(
            "Or Sign Up with",
            style: theme.textTheme.titleMedium,
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 9,
              bottom: 13,
            ),
            child: SizedBox(
              width: 99,
              child: Divider(),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget

  Widget _buildLoginImageStack(BuildContext context) {
    return Stack(
      fit: StackFit.expand, // Ensure the Stack fills the parent
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image(
            image: const AssetImage('assets/midSignUp.png'),
            width: MediaQuery.of(context).size.width,
          ),
        ),
        const Positioned(
          top: 250, // Adjust the fraction as needed
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 44, // Adjust the font size as needed
                fontWeight: FontWeight.bold, // Make the text bold
                color: Color(0xFF654089), // Set the text color
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Navigates to the androidLarge19Screen when the action is triggered.
  onTapLogin(BuildContext context) {
    Navigator.pushNamed(context, '/midSignIn');
  }
}
