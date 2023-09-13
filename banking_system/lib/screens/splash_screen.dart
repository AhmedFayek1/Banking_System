
import 'dart:async';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                const HomeScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(39, 42, 43, 0),
        body: Image.asset("assets/images/splash.png", height: double.infinity,width: double.infinity,fit: BoxFit.fill,)
    );
  }
}