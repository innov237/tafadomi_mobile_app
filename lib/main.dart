import 'package:flutter/material.dart';
import 'package:tafadomi/core/palettes/colors_palette.dart';
import 'package:tafadomi/pages/onboarding_page.dart';
import 'package:tafadomi/routes.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: OnboardingPage.routeName,
      routes: routes,
    );
  }
}

ThemeData theme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: "Muli",
    textTheme: TextTheme(
      bodyText1: TextStyle(color: PaletteColor.textColor),
      bodyText2: TextStyle(color: PaletteColor.textColor),
    ),
    appBarTheme: appBarTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: PaletteColor.primaryColor,
    elevation: 0.0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    textTheme: TextTheme(
      headline6: TextStyle(color: Color(0xFF8B8B8B)),
    ),
  );
}
