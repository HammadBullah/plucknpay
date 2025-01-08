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
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical, // Change scroll direction to vertical
        physics: NeverScrollableScrollPhysics(), // Disable swipe gestures
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
                    ),
                      onPressed: () {
    // Animate to the next page with a smooth vertical scroll
    _pageController.animateToPage(
    1,
    duration: Duration(milliseconds: 3000),
    curve: Curves.easeInOut,
    ); }, label: Text("Scroll up to Sign in!", selectionColor: Colors.black54,),
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
