import 'package:babychart/theme/app_decorations.dart';
import 'package:babychart/theme/custom_text_style.dart';
import 'package:babychart/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class ChildRegister extends StatelessWidget {
  const ChildRegister({Key? key})
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
                _buildRegisterSelection(context),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 29,
                    vertical: 50,
                  ),
                  decoration: AppDecoration.gradientPurpleToPurple,
                  child: Column(
                    children: [
                      
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

  Widget _buildRegisterSelection(BuildContext context) {
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
            "child Register",
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
}