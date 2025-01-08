import 'package:flutter/material.dart';
import 'signup.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: BouncingScrollPhysics(), // Adds a bounce effect
        children: [
          // Landing Page
          Stack(
            children: [
              // Background Image
              Positioned.fill(
                child: Image.asset(
                  'assets/images/pluckn.png', // Replace with your image asset
                  fit: BoxFit.cover,
                ),
              ),

              // Heading and Subtitle (Centered)

              // Highlighted Arrow (Centered at the bottom)
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          // Sign-Up Page
          SignUpPage(), // Replace with your actual Sign-Up Page widget
        ],
      ),
    );
  }
}
