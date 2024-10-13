import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFB06DEE), // Start color
                Color(0xFF67418C), // End color
              ],
              begin: Alignment.topLeft, // Gradient start point
              end: Alignment.bottomRight, // Gradient end point
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image section
              const Image(
                image: AssetImage('assets/mother.png'), // Your image here
                height: 400, // Adjust height as needed
              ),
              const SizedBox(height: 20),
              // Welcome text
              const SizedBox(
                width: 400, // Set the width of the container
                child: Text(
                  "Let's Get\nStarted", // Split into two lines
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign:
                      TextAlign.left, // Align the text within the container
                  maxLines: 2, // Limit to 2 lines
                  overflow:
                      TextOverflow.ellipsis, // Handle overflow with ellipsis
                ),
              ),
              const SizedBox(height: 11),

              // Welcome text
              const SizedBox(
                width: 400, // Set the width of the container
                child: Text(
                  "A smarter way to ensure every child's health is always in check!", // Split into two lines
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign:
                      TextAlign.left, // Align the text within the container
                  maxLines: 2, // Limit to 2 lines
                  overflow:
                      TextOverflow.ellipsis, // Handle overflow with ellipsis
                ),
              ),
              // SizedBox(
              //   width: 400, // Set button width
              //   child: OutlinedButton(
              //     style: OutlinedButton.styleFrom(
              //       backgroundColor: Colors.white,
              //       side: BorderSide(
              //         color: Colors.white, // Border color
              //         width: 2, // Border width
              //       ),
              //       padding: EdgeInsets.symmetric(
              //           vertical: 25), // Increase vertical padding
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //     ),
              //     onPressed: () {
              //       Navigator.pushNamed(context, '/selectingPage');
              //     },
              //     child: Text(
              //       "Login",
              //       style: TextStyle(
              //         fontSize: 18,
              //         color: Color(0xFF67418C),
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 20),
              // Signup button with border
              SizedBox(
                width: 400, // Set button width
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 127, 81, 174), // Background color
                    side: const BorderSide(
                      color: Colors.white, // Border color
                      width: 2, // Border width
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15), // Increase vertical padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                    shadowColor: Colors.black, // Optional shadow color
                    elevation: 5, // Elevation for a shadow effect
                  ).copyWith(
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.white
                              .withOpacity(0.1); // Lighter overlay when pressed
                        } else if (states.contains(MaterialState.hovered)) {
                          return Colors.purple
                              .withOpacity(0.1); // Hover effect color
                        }
                        return Colors.white; // No change in default state
                      },
                    ),
                  ),
                  onPressed: () {
                    // Navigate to signup page
                    Navigator.pushNamed(context, '/selectingPage');
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold, // Make the text bold
                      letterSpacing:
                          1.2, // Add some letter spacing for a modern look
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
