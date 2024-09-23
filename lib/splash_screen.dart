import 'package:flutter/material.dart';
import 'package:scci_app/pages/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Simulate a delay for the splash screen (you can replace this with your actual loading logic)
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the next screen after the splash screen is done
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF696a97),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Centered Image
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              top: 0,
              child: Image.asset("assets/images/scci_logo.png"),
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            // First Text (Animated from left to right)
            TweenAnimationBuilder(
              tween: Tween<double>(begin: -1.0, end: 0.0),
              duration: Duration(milliseconds: 500),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(value * MediaQuery.of(context).size.width, 0),
                  child: child,
                );
              },
              child: Text(
                "THE    SIALKOT    CHAMBER",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFDAA520)),
              ),
            ),
            SizedBox(height: 20),
            // Second Text (Animated from right to left)
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 1.0, end: 0.0),
              duration: Duration(milliseconds: 500),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(value * MediaQuery.of(context).size.width, 0),
                  child: child,
                );
              },
              child: Text(
                "OF COMMERCE & INDUSTRY",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFDAA520)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}