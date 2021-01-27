import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tafadomi/widgets/prestataire.dart';
import 'package:tafadomi/pages/home_page.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      loaderColor: Colors.black,
      backgroundColor: Colors.white,
      image: Image.asset("assets/images/cleaning.png"),
      navigateAfterSeconds: HomePage(),
      photoSize: 100.0,
    );
  }
}
