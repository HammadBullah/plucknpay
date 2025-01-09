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
    // Detect the theme mode (light or dark) of the device
    final brightness = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      appBar: AppBar(
        title: Text('Landing'),
        // App bar theme can also dynamically change based on system theme
        backgroundColor: brightness == Brightness.dark ? Colors.black : Colors.blue,
      ),
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
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
          physics: NeverScrollableScrollPhysics(),
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/pluckn.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: TextButton.icon(
                      icon: Icon(
                        Icons.keyboard_arrow_up,
                        size: 40,
                        color: brightness == Brightness.dark ? Colors.white : Colors.black, // Change icon color based on theme
                      ),
                      onPressed: () {
                        _pageController.animateToPage(
                          1,
                          duration: Duration(milliseconds: 2000),
                          curve: Curves.easeInOut,
                        );
                      },
                      label: Text(
                        "Scroll up to Sign in!",
                        style: TextStyle(
                          color: brightness == Brightness.dark ? Colors.white : Colors.black, // Change text color based on theme
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SignUpPage(),
          ],
        ),
      ),
    );
  }
}
