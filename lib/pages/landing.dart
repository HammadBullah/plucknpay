import 'package:flutter/material.dart';
import 'signup.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          // Check the velocity of the drag to determine direction
          if (details.primaryVelocity! < 0) {
            // Dragged up
            _pageController.animateToPage(
              1,
              duration: Duration(milliseconds: 800),
              curve: Curves.easeInOut,
            );
          }
        },
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(), // Disable manual swipe gestures
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

                // Highlighted Arrow (Centered at the bottom)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: TextButton.icon(
                      icon: Icon(
                        Icons.keyboard_arrow_up,
                        size: 40,
                        color: Colors.deepOrangeAccent,
                      ),
                      onPressed: () {
                        // Trigger page animation
                        _pageController.animateToPage(
                          1,
                          duration: Duration(milliseconds: 2000),
                          curve: Curves.easeInOut,
                        );
                      },
                      label: Text(
                        "Scroll up to Sign in!",
                        style: TextStyle(color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Sign-Up Page
            SignUpPage(), // Replace with your actual Sign-Up Page widget
          ],
        ),
      ),
    );
  }
}
