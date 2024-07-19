import 'package:babychart/auth/auth_service.dart';
import 'package:babychart/signUpPage.dart';
import 'package:babychart/theme/app_decorations.dart';
import 'package:babychart/theme/custom_text_style.dart';
import 'package:babychart/theme/theme_helper.dart';
import 'package:babychart/widgets/custom_checkbox_button.dart';
import 'package:babychart/widgets/custom_elevated_button.dart';
import 'package:babychart/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key})
      : super(
          key: key,
        );
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMeCheckbox = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

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
                            SizedBox(height: 10),
                            _buildPasswordSection(context),
                            SizedBox(height: 17),
                            _buildRememberMeCheckbox(context),
                            SizedBox(height: 7),
                            SizedBox(
                              height: 64,
                              width: 236,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 15),
                                      child: Text(
                                        "Sign In",
                                        style: CustomTextStyles
                                            .titleLargePoppinsWhiteA70001,
                                      ),
                                    ),
                                  ),
                                  CustomElevatedButton(
                                    width: 236,
                                    text: "Login",
                                    onPressed: () {
                                      onTapLogin(context);
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
                            SizedBox(height: 9),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SignUpPage()),
                                );
                              },
                              child: Text(
                                "Forget password?",
                                style: CustomTextStyles.titleMediumGreen400,
                              ),
                            ),
                            SizedBox(height: 9),
                            _buildLoginOptionsRow(context),
                            SizedBox(height: 3),
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

  Widget _buildRememberMeCheckbox(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 7),
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
            "Or Login with",
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
            image: AssetImage('assets/login.png'),
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

  /// Navigates to the androidLarge19Screen when the action is triggered.
  void onTapLogin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await _authService.login(
          userNameController.text,
          passwordController.text,
        );

        Navigator.pushNamed(context, '/selectChild');
        print('Login Successful: ${response['message']}');
      } catch (e) {
        // Handle error (e.g., show error message)
        print('Login Failed: $e');
      }
    }
  }
}
