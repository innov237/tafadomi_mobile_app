import 'package:flutter/widgets.dart';
import 'package:tafadomi/pages/onboarding_page.dart';
import 'package:tafadomi/pages/home_page.dart';

//We user name route
//All our routes will be aviable here
final Map<String, WidgetBuilder> routes = {
  OnboardingPage.routeName: (context) => OnboardingPage(),
  HomePage.routeName: (context) => HomePage(),
};
