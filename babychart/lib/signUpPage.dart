import 'package:babychart/auth/auth_service.dart';
import 'package:babychart/theme/app_decorations.dart';
import 'package:babychart/theme/custom_text_style.dart';
import 'package:babychart/theme/theme_helper.dart';
import 'package:babychart/widgets/custom_checkbox_button.dart';
import 'package:babychart/widgets/custom_elevated_button.dart';
import 'package:babychart/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key})
      : super(
    key: key,
  );
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool rememberMeCheckbox = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5B2D2),
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: 390,
            child: SingleChildScrollView(
              child: SizedBox(
                height: 840,
                width: 390,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 23,
                          vertical: 103,
                        ),
                        decoration: AppDecoration.fillwhiteA.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder50,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildUsernameSection(context),
                            SizedBox(height: 8),
                            _buildPasswordSection(context),
                            SizedBox(height: 8),
                            _buildEmailSection(context),
                            SizedBox(height: 7),
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
                                      onTapSignUp(context);
                                    },
                                    alignment: Alignment.center,
                                    buttonStyle: ButtonStyle(
                                      backgroundColor: MaterialStateProperty
                                          .all<Color>(Color(
                                          0xFFDF32B9)), // Change this to your desired color
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 1),
                            _buildLoginOptionsRow(context),
                            SizedBox(height: 1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 57,
                                  width: 73,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 22,
                                    vertical: 15,
                                  ),
                                  decoration:
                                  AppDecoration.outlinePrimary4.copyWith(
                                    borderRadius:
                                    BorderRadiusStyle.roundedBorder16,
                                  ),
                                  child: Image(
                                      image: AssetImage('assets/facebook.png')),
                                ),
                                Container(
                                  height: 57,
                                  width: 73,
                                  margin: EdgeInsets.only(left: 45),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 22,
                                    vertical: 15,
                                  ),
                                  decoration:
                                  AppDecoration.outlinePrimary4.copyWith(
                                    borderRadius:
                                    BorderRadiusStyle.roundedBorder16,
                                  ),
                                  child: Image(
                                      image: AssetImage('assets/google.png')),
                                )
                              ],
                            ),
                            SizedBox(height: 4)
                          ],
                        ),
                      ),
                    ),
                    _buildLoginImageStack(context)
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
      margin: EdgeInsets.only(left: 7),
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 1),
            child: Text(
              "User Name",
              style: CustomTextStyles.titleLargeMulish,
            ),
          ),
          SizedBox(height: 7),
          OutlineGradientButton(
            padding: EdgeInsets.only(
              left: 1,
              top: 1,
              right: 1,
              bottom: 1,
            ),
            strokeWidth: 1,
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [
                appTheme.purple40001,
                theme.colorScheme.secondaryContainer
              ],
            ),
            corners: Corners(
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
      padding: EdgeInsets.only(left: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 3),
            child: Text(
              "Password",
              style: CustomTextStyles.titleLargeMulish,
            ),
          ),
          SizedBox(height: 9),
          Padding(
            padding: EdgeInsets.only(right: 7),
            child: OutlineGradientButton(
              padding: const EdgeInsets.only(
                left: 1,
                top: 1,
                right: 1,
                bottom: 1,
              ),
              strokeWidth: 1,
              gradient: LinearGradient(
                begin: Alignment(0.5, 0),
                end: Alignment(0.5, 1),
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
      margin: EdgeInsets.only(left: 7),
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 1),
            child: Text(
              "Email",
              style: CustomTextStyles.titleLargeMulish,
            ),
          ),
          SizedBox(height: 7),
          OutlineGradientButton(
            padding: EdgeInsets.only(
              left: 1,
              top: 1,
              right: 1,
              bottom: 1,
            ),
            strokeWidth: 1,
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [
                appTheme.purple40001,
                theme.colorScheme.secondaryContainer
              ],
            ),
            corners: Corners(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: CustomTextFormField(
              controller: emailController,
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
      padding: EdgeInsets.only(left: 14),
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
          Padding(
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
            image: AssetImage('assets/signup.png'),
            width: MediaQuery.of(context).size.width,
          ),
        ),
        const Positioned(
          top: 200, // Adjust the fraction as needed
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              "Sign Up",
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

  /// Navigates to the androidLarge19Screen when the action is triggered.
   void onTapSignUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await authService.register(
          userNameController.text,
          emailController.text,
          passwordController.text,
          passwordController.text,
        );

        Navigator.pushNamed(context, '/selectChild');
        print('Registration Successful: ${response['message']}');
      } catch (e) {
        // Handle registration error (e.g., show error message)
        print('Registration Failed: $e');
      }
    }
  }
}
