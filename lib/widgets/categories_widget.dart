import 'package:flutter/material.dart';

Widget categories() {
  return alignementCategorie();
}

Widget alignementCategorie() {
  return buildCategory();
}

Widget buildCategory() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: double.infinity,
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
    ),
  );
}
