import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Delay for 2 seconds and then navigate to the registration page
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/homescreen');
    });

    return SafeArea(
      child: Scaffold(
        body: Center(child: Image.asset('assets/LOGO.png')),
      ),
    );
  }
}
