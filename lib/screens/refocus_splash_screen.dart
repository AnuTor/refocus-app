import 'dart:async';
import 'package:flutter/material.dart';

import './login_screen.dart';

class RefocusSplashScreen extends StatefulWidget {
  const RefocusSplashScreen({Key? key}) : super(key: key);

  @override
  State<RefocusSplashScreen> createState() => _RefocusSplashScreenState();
}

class _RefocusSplashScreenState extends State<RefocusSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamed(LoginScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/refocus-1080x1920.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
