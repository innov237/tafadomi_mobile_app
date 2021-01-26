import 'package:flutter/material.dart';
import 'package:tafadomi/widgets/servicePage_widget.dart';
import 'package:tafadomi/widgets/AppBar_widget.dart';

class Services extends StatefulWidget {
  static String routeName = "/serviceList_page";
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return serviciesList();
  }
}

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
