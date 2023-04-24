import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen(Key key) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      //Navigate to your desired screen after the splash screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Don't Panic!",
          style: TextStyle(fontSize: 48.0, color: Colors.blue),
        ),
      ),
    );
  }
}
