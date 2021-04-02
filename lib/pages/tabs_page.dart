import 'package:flutter/material.dart';
import 'package:tafadomi/pages/categories/categoriesList_page.dart';
import 'package:tafadomi/pages/home_page.dart';
import 'package:tafadomi/pages/request/historical_page.dart';
import 'package:tafadomi/pages/request/provider_page.dart';

class TabsPage extends StatefulWidget {
  static String routeName = "/TabsPage";
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int currentIndex;

  List<Widget> pages = [
    HomePage(),
    CategoriesListPage(),
    Historical_Page(),
    ServiceProviderPage(),
  ];

  _setPage(index) {
    print(index);
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: Container(
          height: 65.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => _setPage(0),
                  child: Column(
                    children: [
                      Icon(Icons.home),
                      Text("Accueil"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _setPage(1),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/categori.png",
                        height: 25.0,
                      ),
                      Text("Categorie"),
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
                      Text("Commande"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _setPage(3),
                  child: Column(
                    children: [
                      Icon(Icons.menu),
                      Text("Menu"),
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
