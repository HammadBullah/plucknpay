import 'package:flutter/material.dart';
import 'package:plucknpay/pages/signin.dart';
import 'homepage.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Detect the platform's brightness (light or dark mode)
    final Brightness platformBrightness = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        actions: [
          // Optionally, you can include other actions here if needed
        ],
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor, // Use the theme's background color
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Text(
              "Pluck n Pay",
              style: TextStyle(
                fontFamily: 'LeagueSpartan',
                fontSize: 70,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor, // Primary color from the theme
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Shop Smart, Save Big!",
              style: TextStyle(
                fontFamily: 'LeagueSpartan',
                fontSize: 18,
                color: platformBrightness == Brightness.dark ? Colors.grey[400] : Colors.grey[700], // Conditional color based on system theme
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(30.0, 0, 30, 10),
                decoration: BoxDecoration(
                  color: platformBrightness == Brightness.dark
                      ? Colors.grey[900] // Dark background for dark mode
                      : Colors.white, // Light background for light mode
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        prefixIcon: Icon(Icons.person),
                        labelStyle: TextStyle(
                          color: platformBrightness == Brightness.dark
                              ? Colors.white70 // Light label for dark mode
                              : Colors.black87, // Dark label for light mode
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        labelStyle: TextStyle(
                          color: platformBrightness == Brightness.dark
                              ? Colors.white70
                              : Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        labelStyle: TextStyle(
                          color: platformBrightness == Brightness.dark
                              ? Colors.white70
                              : Colors.black87,
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        prefixIcon: Icon(Icons.lock),
                        labelStyle: TextStyle(
                          color: platformBrightness == Brightness.dark
                              ? Colors.white70
                              : Colors.black87,
                        ),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text("Sign Up", style: TextStyle(fontSize: 18)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(_createRoute());
                      },
                      child: Text(
                        "Already have an account? Sign In",
                        style: TextStyle(
                          color: platformBrightness == Brightness.dark
                              ? Colors.white70
                              : Colors.black87,
                        ),
                      ),
                    ),
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
                        foregroundColor: Colors.deepOrangeAccent,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.deepOrangeAccent),
                        ),
                        minimumSize: Size(double.infinity, 50),
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

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignInPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
