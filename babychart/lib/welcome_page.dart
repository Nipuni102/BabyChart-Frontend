import 'package:babychart/theme/custom_button_style.dart';
import 'package:babychart/theme/theme_helper.dart';
import 'package:babychart/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFDF32B9),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 59),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BabyChart",
                style: theme.textTheme.displaySmall,
              ),
              SizedBox(height: 35),
              const Image(image: AssetImage('assets/baby_Img.png')),
              // CustomImageView(
              //   imagePath: ImageConstant.imgStickerTemplat268x240,
              //   height: 268,
              //   width: 240,
              //   radius: BorderRadius.circular(
              //     27,
              //   ),
              // ),
              SizedBox(height: 82),
              CustomElevatedButton(
                height: 50,
                text: "Get Started",
                margin: EdgeInsets.only(
                  left: 22,
                  right: 21,
                ),
                buttonStyle: CustomButtonStyles.fillWhiteATL11,
                buttonTextStyle: theme.textTheme.headlineSmall!,
                onPressed: () {
                  Navigator.pushNamed(context, '/selectingPage');
                },
              ),
              SizedBox(height: 4)
            ],
          ),
        ),
      ),
    );
  }
}
