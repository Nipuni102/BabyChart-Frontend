import 'package:babychart/theme/app_decorations.dart';
import 'package:babychart/theme/theme_helper.dart';
import 'package:babychart/widgets/custom_elevated_button.dart';
import 'package:babychart/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class SelectingPage extends StatelessWidget {
  const SelectingPage({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildAccountTypeSelection(context),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 60),
                decoration: AppDecoration.gradientPurpleToPurple,
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    _buildwomenTrendySection(context),
                    SizedBox(height: 17),
                    _buildMidwifeAccountSection(context),
                    SizedBox(height: 60),
                    CustomElevatedButton(
                      text: "Sign UP",
                      margin: EdgeInsets.symmetric(horizontal: 46),
                      buttonStyle: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFFDF32B9),
                        ),
                      ),
                      onPressed: () {
                        onTapSignup(context);
                      },
                    ),
                    SizedBox(height: 14)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}


  // Section MidContent
  Widget _buildAccountTypeSelection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 34.5,
        horizontal: 40.0,
      ),
      color: Color(0xFFDF32B9),
      child: Column(
        children: [
          Text(
            "Choose Account Type",
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildwomenTrendySection(BuildContext context) {
    return SizedBox(
      height: 187,
      width: 314,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/signIn');
              },
              child: Container(
                margin: EdgeInsets.only(right: 13),
                padding: EdgeInsets.symmetric(horizontal: 76, vertical: 23),
                decoration: AppDecoration.outlinePrimaryContainer2.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder21,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage('assets/parent.png')),
                    SizedBox(height: 10),
                    Text(
                      "Parent Account",
                      style: theme.textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildMidwifeAccountSection(BuildContext context) {
    return SizedBox(
      height: 187,
      width: 314,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/midSignIn');
              },
              child: Container(
                margin: EdgeInsets.only(right: 13),
                padding: EdgeInsets.symmetric(horizontal: 76, vertical: 23),
                decoration: AppDecoration.outlinePrimaryContainer2.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder21,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage('assets/midwife.png')),
                    SizedBox(height: 10),
                    Text(
                      "Midwife Account",
                      style: theme.textTheme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onTapSignup(BuildContext context) {
    Navigator.pushNamed(context, '/midSignup');
  }
}
