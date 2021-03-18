import 'package:flutter/material.dart';
import 'package:tafadomi/widgets/servicePage_widget.dart';
import 'package:tafadomi/widgets/AppBar_widget.dart';

class ServicePage extends StatefulWidget {
  final serviceData;
  ServicePage({this.serviceData});

  static String routeName = "/serviceList_page";
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  void initState() {
    super.initState();
    print(this.widget.serviceData);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: widget.serviceData.length,
          itemBuilder: (BuildContext context, int index) {
            return ServiceWidget(serviceData: widget.serviceData[index]);
          },
        ),
      ),
    );
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
