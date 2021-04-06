import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tafadomi/pages/home_page.dart';
import 'package:tafadomi/features/auth/login/login_page.dart';

class Splash extends StatefulWidget {
  static String routeName = '/splash';
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      loaderColor: Colors.black,
      backgroundColor: Colors.white,
      image: Image.asset("assets/images/logo.png"),
      navigateAfterSeconds: LoginPage(),
      photoSize: 100.0,
    );
  }
}
