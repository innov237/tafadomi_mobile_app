import 'package:flutter/material.dart';

Widget categories() {
  return alignementCategorie();
}

Widget alignementCategorie() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildCategory(),
          buildCategory(),
        ],
      ),
    ),
  );
}

Widget buildCategory() {
  return Container(
    width: 150.0,
    child: Card(
      child: Column(
        children: [
          Container(
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/cleaning.png"),
            ),
          ),
          SizedBox(
            height: 9.0,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text("beauty"),
          ),
        ],
      ),
    ),
  );
}
