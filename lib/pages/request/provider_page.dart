import 'package:flutter/material.dart';
import 'package:tafadomi/core/palettes/colors_palette.dart';

class ServiceProviderPage extends StatefulWidget {
  @override
  _ServiceProviderPageState createState() => _ServiceProviderPageState();
}

class _ServiceProviderPageState extends State<ServiceProviderPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 50.0,
              color: PaletteColor.primaryColor,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Prestataire",
                      style: TextStyle(fontSize: 21.0),
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Container(
                            height: 90.0,
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/cleaning.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 1.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Lesly"),
                            SizedBox(
                              height: 9.0,
                            ),
                            Text("Plombier")
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: RaisedButton(
                            color: Color(0xFF44D7F1),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text("appeler",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60.0,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Container(
                            child: RaisedButton(
                              color: PaletteColor.primaryColor,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.message,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text("message",
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Detail sur le service",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "reparation colone douche",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.date_range),
                                SizedBox(
                                  width: 1.0,
                                ),
                                Text("date"),
                              ],
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Text("21 janvier 2021"),
                          ],
                        ),
                        SizedBox(
                          width: 80.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.timer),
                                SizedBox(
                                  width: 1.0,
                                ),
                                Text("heure"),
                              ],
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            Text("14h30"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                Text("Localisation"),
                              ],
                            ),
                            Text("Yaounde Tsinga fecafoot"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("signaler un probleme"),
                        Text(
                          "rencontrez vous des problemes avec\n le prestataire?",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        width: 300.0,
                        child: Center(
                          child: RaisedButton(
                            color: Colors.red[400],
                            onPressed: () {},
                            child: Center(
                              child: Text(
                                "signalez un probleme",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
