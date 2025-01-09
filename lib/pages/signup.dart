import 'package:flutter/material.dart';
import 'package:plucknpay/pages/signin.dart';
import 'homepage.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDarkMode
                  ? [Colors.deepOrangeAccent, Colors.black]
                  : [Colors.deepOrangeAccent, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
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
                  color: platformBrightness == Brightness.dark ? Colors.grey[400] : Colors.white60,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: true,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(30.0, 30, 30, 10),
                        decoration: BoxDecoration(
                          color: platformBrightness == Brightness.dark
                              ? Colors.grey[900]
                              : Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                  prefixIcon: Icon(Icons.person, color: theme.primaryColor),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(color: theme.primaryColor),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email, color: theme.primaryColor),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(color: theme.primaryColor),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock, color: theme.primaryColor),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(color: theme.primaryColor),
                                  ),
                                ),
                                obscureText: true,
                              ),
                              SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  prefixIcon: Icon(Icons.lock, color: theme.primaryColor),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(color: theme.primaryColor),
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
                                child: Text(
                                  "Sign Up",
                                  style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(_createRoute());
                                },
                                child: Text(
                                  "Already have an account? Sign In",
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: platformBrightness == Brightness.dark
                                        ? Colors.white70
                                        : Colors.black87,
                                  ),
                                ),
                              ),
                              Divider(height: 40),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
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
