import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tafadomi/core/constantes/api_constante.dart';
import 'package:tafadomi/core/palettes/colors_palette.dart';
import 'package:tafadomi/widgets/promoService_widget.dart';
import 'package:tafadomi/widgets/servicePage.dart';
import 'package:tafadomi/widgets/request.dart';
import 'package:tafadomi/widgets/prestataire.dart';
import 'package:tafadomi/widgets/serviceRequest.dart';
import 'package:tafadomi/widgets/AppBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getCategorie() async {
    Dio dio = Dio();
    final response = await dio.get(ApiConst.baseUrl + ApiConst.getCategorieUrl);
    print(response.data);
    if (response.statusCode == 200) {
      print(response.data);
    } else {
      print(response);
    }
  }

  @override
  void initState() {
    super.initState();
    getCategorie();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            costumAppBar(),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _pormoServices(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _categorieList(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          height: 60.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Icon(Icons.home),
                      Text("Accueil"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => null,
                  child: Column(
                    children: [
                      Icon(Icons.home),
                      Text("Accueil"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => null,
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

  _pormoServices() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "A la une",
            style: TextStyle(
              color: PaletteColor.secondaryColor,
              fontSize: 20.0,
            ),
          ),
        ),
        Container(
          height: 265.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ServicePromoWidget(),
              ServicePromoWidget(),
              ServicePromoWidget(),
            ],
          ),
        ),
      ],
    );
  }

  _categorieList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Nos Categories",
            style: TextStyle(
              color: PaletteColor.secondaryColor,
              fontSize: 20.0,
            ),
          ),
        ),
        Container(
          child: Text("categorie row"),
        ),
      ],
    );
  }
}
