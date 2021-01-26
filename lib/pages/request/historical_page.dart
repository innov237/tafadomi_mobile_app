import 'package:flutter/material.dart';
import 'package:tafadomi/widgets/AppBar.dart';
import 'package:tafadomi/widgets/request.dart';

class HistoricalPage extends StatefulWidget {
  @override
  _HistoricalPageState createState() => _HistoricalPageState();
}

class _HistoricalPageState extends State<HistoricalPage> {
  

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
