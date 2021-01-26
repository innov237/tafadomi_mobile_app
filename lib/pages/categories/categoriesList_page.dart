import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:tafadomi/widgets/categories_widget.dart';
import 'package:tafadomi/widgets/AppBar_widget.dart';

class CategoriesList_page extends StatefulWidget {
  static String routeName = "/categoriesList_page";
  @override
  _CategoriesList_pageState createState() => _CategoriesList_pageState();
}

class _CategoriesList_pageState extends State<CategoriesList_page> {
  @override
  Widget build(BuildContext context) {
    return categoriesList();
  }
}

Widget categoriesList() {
  return SafeArea(
    child: Scaffold(
      body: Column(
        children: [
          costumAppBar(),
          categories(),
          categories(),
        ],
      ),
    ),
  );
}
