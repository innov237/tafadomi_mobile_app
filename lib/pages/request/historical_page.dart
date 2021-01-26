import 'package:flutter/material.dart';
import 'package:tafadomi/widgets/AppBar_widget.dart';
import 'package:tafadomi/widgets/request_widget.dart';

class Historical_Page extends StatefulWidget {
  static String routeName = "/historical_page";
  @override
  _Historical_PageState createState() => _Historical_PageState();
}

class _Historical_PageState extends State<Historical_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Column(
            children: [
              costumAppBar(),
              SizedBox(
                height: 7.0,
              ),
              Text("Historiques des demandes"),
              SizedBox(
                height: 10.0,
              ),
              RequestHistoricalWidget(),
            ],
          ),
        ]),
      ),
    );
  }
}
