import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:tafadomi/widgets/categories.dart';
import 'package:tafadomi/widgets/AppBar.dart';

Widget categoriesList() {
  return SafeArea(
    child: Scaffold(
      body: ListView(
        children: [
          costumAppBar(),
          categories(),
          categories(),
        ],
      ),
    ),
  );
}
