import 'package:flutter/material.dart';

class serviceForm extends StatefulWidget {
  @override
  _serviceFormState createState() => _serviceFormState();
}

class _serviceFormState extends State<serviceForm> {
  String name;
  String icon;
  String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("commandez service"),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
      ),
    );
  }
}
