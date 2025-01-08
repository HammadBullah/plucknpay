import 'package:flutter/material.dart';
import 'package:plucknpay/pages/signup.dart';
import 'homepage.dart';

class SignInPage extends StatelessWidget {
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignUpPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Starting point for animation (from right to left)
        const end = Offset.zero; // Ending point (where the page will settle)
        const curve = Curves.easeInOut; // Animation curve for smooth transition
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrangeAccent, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // "Pluck n Pay" Header
            SizedBox(height: screenHeight * 0.1),
            Text(
              "Pluck n Pay",
              style: TextStyle(
                fontFamily: 'LeagueSpartan',
                fontSize: 70,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Shop Smart, Save Big!",
              style: TextStyle(
                fontFamily: 'LeagueSpartan',
                fontSize: 18,
                color: Colors.white54,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.05), // Spacer to 20% of screen height

            // Fields Section
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(30.0, 0, 30, 10),
                decoration: BoxDecoration(
                  color: Colors.white, // Light grey background color
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Email Field
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email, color: Colors.deepOrangeAccent),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.deepOrangeAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.deepOrangeAccent),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Password Field
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock, color: Colors.deepOrangeAccent),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.deepOrangeAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.deepOrangeAccent),
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),

                    // Sign-In Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: EdgeInsets.symmetric(vertical: 20), // Only vertical padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: Size(double.infinity, 50), // Full width button
                      ),
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Sign-Up Button
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(_createRoute()); // Navigate to Sign-Up page
                      },
                      child: Text(
                        "Don't have an account? Sign Up",
                        style: TextStyle(color: Colors.deepOrangeAccent),
                      ),
                    ),
                    Divider(height: 30),

                    // Google Sign-In Button
                    ElevatedButton.icon(
                      onPressed: () {
                        // Add Google login logic
                      },
                      icon: Image.asset(
                        'assets/images/glogo-removebg-preview.png', // Add Google logo image
                        height: 24,
                        width: 24,
                      ),
                      label: Text("Sign In with Google"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.deepOrangeAccent,
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.deepOrangeAccent),
                        ),
                        minimumSize: Size(double.infinity, 50), // Full width button
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
