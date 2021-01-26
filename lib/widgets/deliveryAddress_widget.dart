import 'package:flutter/material.dart';
import 'package:tafadomi/core/palettes/colors_palette.dart';

Widget deliveryAddress() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Column(
      children: [
        Text(
          "adresse de livraison",
          style: TextStyle(fontSize: 12.0),
        ),
        SizedBox(
          height: 8.0,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "quartier"),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "numero de telephone"),
        ),
        SizedBox(
          height: 13.0,
        ),
        Container(
          width: 280.0,
          child: RaisedButton(
            onPressed: () {},
            child: Text("validez"),
          ),
        )
      ],
    ),
  );
}
