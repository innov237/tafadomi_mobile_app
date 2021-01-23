import 'package:flutter/material.dart';
import 'package:tafadomi/core/palettes/colors_palette.dart';
import 'package:tafadomi/pages/home_page.dart';

Widget service() {
  return Container(
    height: 130.0,
    child: Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100.0,
            width: 90.0,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/cleaning.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Soin de visage",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
                Text("a partir de 10.000"),
                ClipRRect(
                  borderRadius: BorderRadius.circular(17.0),
                  child: Container(
                    child: RaisedButton(
                      padding: EdgeInsets.zero,
                      elevation: 0.0,
                      onPressed: () {},
                      child: Text(
                        "commander",
                        style: TextStyle(
                            color: Color(0xFF44D7F1),
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0),
                      ),
                      color: Color(0xFF372e5a),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget servicePromo() {
  return Stack(
    children: [
      Container(
        height: 130.0,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100.0,
                width: 90.0,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/cleaning.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Soin de visage",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    Text("a partir de 10.000"),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(17.0),
                      child: Container(
                        child: RaisedButton(
                          padding: EdgeInsets.zero,
                          elevation: 0.0,
                          onPressed: () {},
                          child: Text(
                            "commander",
                            style: TextStyle(
                                color: Color(0xFF44D7F1),
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0),
                          ),
                          color: Color(0xFF372e5a),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        right: 0.0,
        child: Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            border: Border.all(color: PaletteColor.secondaryColor),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              "-14%",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
