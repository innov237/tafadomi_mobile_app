import 'package:flutter/material.dart';
import 'package:tafadomi/widgets/servicePage.dart';
import 'package:tafadomi/widgets/AppBar.dart';

Widget serviciesList() {
  return SafeArea(
    child: Scaffold(
      body: ListView(
        children: [
          costumAppBar(),
          service(),
        ],
      ),
    ),
  );
}
