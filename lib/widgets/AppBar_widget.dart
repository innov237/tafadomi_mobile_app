import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tafadomi/core/palettes/colors_palette.dart';

Widget costumAppBar() {
  return Stack(
    children: [
      Container(
        height: 100.0,
        color: PaletteColor.primaryColor,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30.0,
          horizontal: 10.0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            height: 40.0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 230.0,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "rechercher",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
