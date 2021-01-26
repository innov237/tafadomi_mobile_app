import 'package:flutter/material.dart';
import 'package:tafadomi/pages/categories/categoriesList_page.dart';
import 'package:tafadomi/pages/home_page.dart';
import 'package:tafadomi/pages/request/provider_page.dart';

class TabsPage extends StatefulWidget {
  static String routeName = "/TabsPage";
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 1;
    List<Widget> pages = [
      HomePage(),
      CategoriesList_page(),
    ];

    _setPage(index) {
      setState(() {
        currentIndex = index;
      });
    }

    return SafeArea(
      child: Scaffold(
        body: HomePage(),
        bottomNavigationBar: Container(
          height: 60.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ServiceProviderPage.routeName);
                  },
                  child: Column(
                    children: [
                      Icon(Icons.home),
                      Text("Accueil"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _setPage(0),
                  child: Column(
                    children: [
                      Icon(Icons.home),
                      Text("0"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _setPage(2),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/request-icon.png",
                        height: 25.0,
                      ),
                      Text("Accueil"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => null,
                  child: Column(
                    children: [
                      Icon(Icons.menu),
                      Text("Accueil"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
