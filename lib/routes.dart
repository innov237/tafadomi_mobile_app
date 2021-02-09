import 'package:flutter/widgets.dart';
import 'package:tafadomi/features/auth/login/login_page.dart';
import 'package:tafadomi/pages/onboarding_page.dart';
import 'package:tafadomi/pages/home_page.dart';
import 'package:tafadomi/pages/_services/serviceList_page.dart';
import 'package:tafadomi/pages/categories/categoriesList_page.dart';
import 'package:tafadomi/pages/request/historical_page.dart';
import 'package:tafadomi/pages/request/provider_page.dart';
import 'package:tafadomi/pages/_services/serviceForm_page.dart';
import 'package:tafadomi/pages/tabs_page.dart';

//We user name route
//All our routes will be aviable here
final Map<String, WidgetBuilder> routes = {
  OnboardingPage.routeName: (context) => OnboardingPage(),
  HomePage.routeName: (context) => HomePage(),
  ServicePage.routeName: (context) => ServicePage(),
  CategoriesListPage.routeName: (context) => CategoriesListPage(),
  Historical_Page.routeName: (context) => Historical_Page(),
  ServiceProviderPage.routeName: (context) => ServiceProviderPage(),
  TabsPage.routeName: (context) => TabsPage(),
  ServiceForm.routeName: (context) => ServiceForm(),
  LoginPage.routeName :(conext)=>LoginPage(),
};
