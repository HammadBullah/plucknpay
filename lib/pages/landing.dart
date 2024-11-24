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
                  'assets/images/istockphoto-1316757372-612x612.jpg', // Replace with your image asset
                  fit: BoxFit.cover,
                ),
              ),

              // Heading and Subtitle (Bottom Left)
              Positioned(
                bottom: 120,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to Pluck\'nPay", // Heading
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black45,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Shop smart, save big!", // Subtitle
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              // Highlighted Arrow (Bottom Right)
              Positioned(
                bottom: 50,
                right: 20,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 28,
                  color: Colors.white,
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
