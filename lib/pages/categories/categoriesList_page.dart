import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:tafadomi/core/constantes/api_constante.dart';
import 'package:tafadomi/pages/_services/serviceList_page.dart';
import 'package:tafadomi/pages/categories/models/categorie_model.dart';
import 'package:tafadomi/core/models/api_response.dart';
import 'package:tafadomi/widgets/categories_widget.dart';

class CategoriesListPage extends StatefulWidget {
  static String routeName = "/CategoriesListPage";
  @override
  _CategoriesListPageState createState() => _CategoriesListPageState();
}

class _CategoriesListPageState extends State<CategoriesListPage> {
  List<Categorie> categorieData;
  bool loading = true;

  getCategorie() async {
    Dio dio = Dio();
    final response = await dio.get(ApiConst.baseUrl + ApiConst.getCategorieUrl);

    if (response.statusCode == 200) {
      ApiResponse apiResponse = apiResponseFromJson(
        json.encode(response.data),
      );
      if (apiResponse.success) {
        setState(() {
          categorieData = categorieFromJson(
            json.encode(apiResponse.data),
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
    super.initState();
    getCategorie();
  }

  @override
  Widget build(BuildContext context) {
    return categoriesList();
  }

  Widget categoriesList() {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Categorie"),
        ),
        body: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: categorieData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.3,
                    mainAxisSpacing: 0.3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ServicePage(
                            serviceData: categorieData[index].service,
                          ),
                        ),
                      ),
                      child: CategorieWidget(
                        categorieData: categorieData[index],
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
