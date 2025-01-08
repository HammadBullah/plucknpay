import 'package:flutter/material.dart';
import 'package:plucknpay/pages/signin.dart';
import 'homepage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black38, Colors.black],
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
            SizedBox(height: screenHeight * 0.1), // Spacer to 20% of screen height

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
                    // Name Field
                    TextFormField(
                      focusNode: _nameFocusNode,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        prefixIcon: Icon(Icons.person, color: _nameFocusNode.hasFocus ? Colors.deepOrangeAccent : Colors.deepOrangeAccent),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: _nameFocusNode.hasFocus ? Colors.deepOrangeAccent : Colors.deepOrangeAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.deepOrangeAccent),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Email Field
                    TextField(
                      focusNode: _emailFocusNode,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email, color: _emailFocusNode.hasFocus ? Colors.deepOrangeAccent : Colors.deepOrangeAccent),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: _emailFocusNode.hasFocus ? Colors.deepOrangeAccent : Colors.deepOrangeAccent),
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
                      focusNode: _passwordFocusNode,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock, color: _passwordFocusNode.hasFocus ? Colors.deepOrangeAccent : Colors.deepOrangeAccent),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: _passwordFocusNode.hasFocus ? Colors.deepOrangeAccent : Colors.deepOrangeAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.deepOrangeAccent),
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 10),

                    // Confirm Password Field
                    TextField(
                      focusNode: _confirmPasswordFocusNode,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        prefixIcon: Icon(Icons.lock, color: _confirmPasswordFocusNode.hasFocus ? Colors.deepOrangeAccent : Colors.deepOrangeAccent),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: _confirmPasswordFocusNode.hasFocus ? Colors.deepOrangeAccent : Colors.deepOrangeAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.deepOrangeAccent),
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),

                    // Sign-Up Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Sign-In Button
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
                        );
                      },
                      child: Text(
                        "Already have an account? Sign In",
                        style: TextStyle(color: Colors.deepOrangeAccent),
                      ),
                    ),
                    Divider(height: 30),

                    // Google Sign-Up Button
                    ElevatedButton.icon(
                      onPressed: () {
                        // Add Google login logic
                      },
                      icon: Image.asset(
                        'assets/images/glogo-removebg-preview.png',
                        height: 24,
                        width: 24,
                      ),
                      label: Text("Sign Up with Google"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.green.shade700,
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.green.shade700),
                        ),
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
