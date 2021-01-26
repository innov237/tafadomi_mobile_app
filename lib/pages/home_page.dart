import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tafadomi/core/constantes/api_constante.dart';
import 'package:tafadomi/core/palettes/colors_palette.dart';
import 'package:tafadomi/widgets/promoService_widget.dart';
import 'package:tafadomi/widgets/servicePage_widget.dart';
import 'package:tafadomi/widgets/AppBar_widget.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List promoServiceData = [
    {'label': "Beauty", "description": "Beauty services"},
    {'label': "Demenagement", "description": "Demenagement services"},
    {'label': "Baby seting", "description": "Baby seting services"},
  ];

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
                      servicePromo(),
                    ],
                  ),
                ],
              ),
            )
          ],
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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: promoServiceData.length,
            itemBuilder: (BuildContext context, int index) {
              return ServicePromoWidget(
                promoServiceData: promoServiceData[index],
              );
            },
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
