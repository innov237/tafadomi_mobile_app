import 'package:flutter/material.dart';
import 'package:tafadomi/core/palettes/colors_palette.dart';
import 'package:tafadomi/widgets/promoService_widget.dart';
import 'package:tafadomi/widgets/servicePage_widget.dart';
import 'package:tafadomi/widgets/servicePromoWidget.dart';
import 'package:tafadomi/widgets/AppBar_widget.dart';
import 'package:dio/dio.dart';
import 'package:tafadomi/core/models/api_response.dart';
import 'package:tafadomi/core/constantes/api_constante.dart';
import 'dart:convert';
import 'package:tafadomi/pages/_services/discounted/model/discountedModel.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DiscountedService discountedData;
  bool loading = true;

  getServicePromo() async {
    Dio dio = Dio();
    final response =
        await dio.get(ApiConst.baseUrl + ApiConst.discountedServiceUrl);

    if (response.statusCode == 200) {
      ApiResponse apiResponse = apiResponseFromJson(
        json.encode(response.data),
      );
      print(response.data['data']);

      if (apiResponse.success) {
        setState(() {
          discountedData = discountedServiceFromJson(
            json.encode(response.data['data']),
          );
          loading = false;
        });
      }
    } else {
      print(response);
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    getServicePromo();
    super.initState();
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
          child: discountedData != null
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: discountedData.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ServicePromoWidget(
                      promoServiceData: discountedData.data[index],
                    );
                  },
                )
              : Center(child: CircularProgressIndicator()),
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
