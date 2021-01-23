import 'package:flutter/material.dart';

Widget requestHistorical() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: InkWell(
      onTap: () {},
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("soin de visage"),
                Text(
                  "Status",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "21/01/2021",
              style: TextStyle(fontSize: 10.0),
            ),
            Divider(),
          ],
        ),
      ),
    ),
  );
}
