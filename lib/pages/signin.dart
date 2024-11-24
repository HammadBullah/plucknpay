import 'package:flutter/material.dart';
import 'package:plucknpay/pages/signup.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade100, Colors.green.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade800,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email, color: Colors.green),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock, color: Colors.green),
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add sign-in logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Sign In",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()), // Navigate to Sign-Up page
                );
              },
              child: Text(
                "Don't have an account? Sign Up",
                style: TextStyle(color: Colors.green.shade700),
              ),
            ),
            Divider(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                // Add Google login logic
              },
              icon: Image.asset(
                'assets/google_logo.png', // Add Google logo image
                height: 24,
                width: 24,
              ),
              label: Text("Sign In with Google"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.green.shade700, backgroundColor: Colors.white,
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
    );
  }
}
