import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1000), () {
      Navigator.pushNamed(context, '/main/home');
    });
    return Scaffold(
      body: Container(
        child: SpinKitChasingDots(
          color: Colors.lightBlue,
          size: 100,
        ),
      ),
    );
  }
}
