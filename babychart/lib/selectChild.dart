import 'package:babychart/theme/app_decorations.dart';
import 'package:babychart/theme/custom_text_style.dart';
import 'package:babychart/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SelectChild extends StatefulWidget {
  final String token; // Pass the token from the previous screen or authentication

  SelectChild({required this.token});

  @override
  _SelectChildState createState() => _SelectChildState();
}

class _SelectChildState extends State<SelectChild> {
  Future<Map<String, dynamic>> fetchUserDetails() async {
    final response = await http.get(
      Uri.parse('http://51.20.246.58/user'),
      headers: {
        'Authorization': 'Bearer ${widget.token}',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user details');
    }
  }

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
                      FutureBuilder<Map<String, dynamic>>(
                        future: fetchUserDetails(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            var user = snapshot.data!;
                            return _buildProfileSection(context, user);
                          } else {
                            return Text('No data available');
                          }
                        },
                      ),
                      SizedBox(height: 50),
                      // _buildAddChildSection(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context, Map<String, dynamic> user) {
    List<dynamic> children = user['data']['children'] ?? [];

    return Column(
      children: children.map((child) => _buildChildCard(context, child)).toList(),
    );
  }

  Widget _buildChildCard(BuildContext context, Map<String, dynamic> child) {
    return GestureDetector(
      onTap: () {
        onTapProfileSection(context, child);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        decoration: AppDecoration.outlinePrimaryContainer2.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder21,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(image: AssetImage('assets/piumi.png')),
              SizedBox(height: 17),
              Text(
                child['name'] ?? 'No Name',
                style: CustomTextStyles.headlineSmallInterPrimary,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddChildSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapAddChildSection(context);
      },
      child: Container(
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

  void onTapProfileSection(BuildContext context, Map<String, dynamic> child) {
    Navigator.pushNamed(
      context,
      '/nav',
      arguments: {
      'token': widget.token,
      'child': child,
    }, // Pass child data as arguments
    );
  }

  void onTapAddChildSection(BuildContext context) {
    Navigator.pushNamed(context, '/childRegister');
  }
}
