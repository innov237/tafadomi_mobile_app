import 'package:flutter/material.dart';
import 'package:tafadomi/core/palettes/colors_palette.dart';

class ServicePromoWidget extends StatefulWidget {
  @override
  _ServicePromoWidgetState createState() => _ServicePromoWidgetState();
}

class _ServicePromoWidgetState extends State<ServicePromoWidget> {
  @override
  Widget build(BuildContext context) {
    return promocard();
  }
}

Widget promocard() {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            width: 200.0,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 120.0,
                        width: 170.0,
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/cleaning.png"),
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 73.0),
                        child: Text(
                          "Déménagement",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: Text(
                          "à partir de 10.000 FCFA",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "deplacer un meuble amenagemnentccccccccccccccccccc ...",
                          style: TextStyle(fontSize: 13.0),
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      width: double.infinity,
                      height: 40.0,
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
                    ),
                  ),
                ],
              ),
            ),
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
