import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:tafadomi/widgets/categories_widget.dart';
import 'package:tafadomi/widgets/AppBar_widget.dart';

class CategoriesListPage extends StatefulWidget {
  static String routeName = "/CategoriesListPage";
  @override
  _CategoriesListPageState createState() => _CategoriesListPageState();
}

class _CategoriesListPageState extends State<CategoriesListPage> {
  @override
  Widget build(BuildContext context) {
    return categoriesList();
  }
}

Widget categoriesList() {
  return SafeArea(
    child: Scaffold(
      appBar: AppBar(title: Text("Categorie"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.3,
            mainAxisSpacing: 0.3,
          ),
          itemBuilder: (BuildContext context, int index) {
            return categories();
          },
        ),
      ),
    ),
  );
}
