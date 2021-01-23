import 'package:flutter/material.dart';
import 'package:tafadomi/widgets/request.dart';
import 'package:tafadomi/widgets/AppBar.dart';

class Historical extends StatefulWidget {
  @override
  _HistoricalState createState() => _HistoricalState();
}

class _HistoricalState extends State<Historical> {
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
              requestHistorical(),
            ],
          ),
        ]),
      ),
    );
  }
}
