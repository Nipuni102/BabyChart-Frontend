import 'package:babychart/theme/app_decorations.dart';
import 'package:babychart/theme/custom_text_style.dart';
import 'package:babychart/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class SelectChild extends StatelessWidget {
  const SelectChild({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                _buildChildSelection(context),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 29,
                    vertical: 50,
                  ),
                  decoration: AppDecoration.gradientPurpleToPurple,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      _buildProfileSection(context),
                      SizedBox(height: 50),
                      _buildAddChildSection(context)
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

  Widget _buildChildSelection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 34.5,
        horizontal: 40.0,
      ),
      color: Color(0xFFDF32B9),
      child: Column(
        children: [
          SizedBox(height: 31),
          Text(
            "Select the child",
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget

  Widget _buildProfileSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapProfileSection(context);
      },
      child: Container(
        margin: EdgeInsets.only(left: 1),
        padding: EdgeInsets.symmetric(
          horizontal: 60,
          vertical: 15,
        ),
        decoration: AppDecoration.outlinePrimaryContainer2.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder21,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(image: AssetImage('assets/piumi.png')),
            SizedBox(height: 14),
            Text(
              "Piumi Wathsala",
              style: CustomTextStyles.headlineSmallInterPrimary,
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  /// Section Widget

  Widget _buildAddChildSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 103,
        vertical: 14,
      ),
      decoration: AppDecoration.outlinePrimaryContainer2.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder21,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 34),
          Image(image: AssetImage('assets/plus.png')),
          SizedBox(height: 39),
          Text(
            "Add Child",
            style: theme.textTheme.titleLarge,
          )
        ],
      ),
    );
  }

  /// Navigates to the androidLarge1Screen when the action is triggered.

  onTapProfileSection(BuildContext context) {
    Navigator.pushNamed(context, '/nav');
  }
}
