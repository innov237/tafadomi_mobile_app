import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 5.0,
            ),
            child: Text(
              "2/3",
              style: TextStyle(color: Color(0xFF7165E1), fontSize: 16.0),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                right: 5.0,
              ),
              child: Text(
                "Ship",
                style: TextStyle(color: Color(0xFF7165E1), fontSize: 16.0),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _userCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userCard() {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Container(
                width: 200.0,
                child: Card(
                  elevation: 0.0,
                  color: Color(0xFF7165E1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        "Cedric djiele",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text("Feed"),
                              Text("14"),
                            ],
                          ),
                          Column(
                            children: [
                              Text("Followers"),
                              Text("552"),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      RaisedButton(
                        onPressed: () => null,
                        elevation: 0.0,
                        child: Text(
                          "Followed",
                          style: TextStyle(
                            color: Color(0xFF7165E1),
                            fontSize: 16.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              child: CircleAvatar(
                radius: 40.0,
              ),
            ),
          ],
        )
      ],
    );
  }
}
