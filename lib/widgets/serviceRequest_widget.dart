import 'package:flutter/material.dart';

class ServiceRequestWidget extends StatefulWidget {
  @override
  _ServiceRequestWidgetState createState() => _ServiceRequestWidgetState();
}

class _ServiceRequestWidgetState extends State<ServiceRequestWidget> {
  @override
  Widget build(BuildContext context) {
    return serviceRequest();
  }
}

Widget serviceRequest() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Column(
      children: [
        Text(
          "commander service",
          style: TextStyle(fontSize: 10.0),
        ),
        SizedBox(
          height: 13.0,
        ),
        Container(
          width: 280.0,
          child: RaisedButton(
            padding: EdgeInsets.zero,
            elevation: 0.0,
            onPressed: () {},
            child: Text(
              "commander",
              style: TextStyle(
                  color: Color(0xFF44D7F1),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
            color: Color(0xFF372e5a),
          ),
        )
      ],
    ),
  );
}
