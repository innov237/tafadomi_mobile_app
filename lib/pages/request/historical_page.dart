import 'package:flutter/material.dart';
import 'package:tafadomi/core/models/api_response.dart';
import 'package:tafadomi/pages/_services/model/model_request.dart';
import 'package:tafadomi/widgets/AppBar_widget.dart';
import 'package:dio/dio.dart';
import 'package:tafadomi/core/constantes/api_constante.dart';
import 'package:tafadomi/widgets/request_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tafadomi/pages/request/provider_page.dart';
import 'package:tafadomi/core/shared_service.dart';
import 'dart:convert';

class Historical_Page extends StatefulWidget {
  static String routeName = "/serviceRequest";
  @override
  _Historical_PageState createState() => _Historical_PageState();
}

class _Historical_PageState extends State<Historical_Page> {
  ServiceRequest requestData;
  String token;
  var userData;

  Future getUserData() async {
    var data = await PreferenceStorage.getDataFormPreferences("userData");
    setState(() {
      userData = json.decode(data);
    });
    getHistorique(userData['data']['original']['access_token']);
  }

  getHistorique(token) async {
    Dio dio = Dio();
    final response = await dio.get(
        ApiConst.baseUrl + ApiConst.serviceRequestUrl,
        queryParameters: {"token": token});
    if (response.statusCode == 200) {
      ApiResponse apiResponse = apiResponseFromJson(
        json.encode(response.data),
      );
      print(response.data['data']);

      if (apiResponse.success) {
        setState(() {
          requestData = serviceRequestFromJson(
            json.encode(response.data['data']),
          );
        });
      }
    } else {
      print(response);
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return historical();
  }

  Widget historical() {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("historique des demandes"),
        ),
        body: Center(
          child: requestData != null
              ? ListView.builder(
                  itemCount: requestData.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ServiceProviderPage(
                            historicData: requestData.data[index],
                          ),
                        ),
                      ),
                      child: RequestHistoricalWidget(
                        requestData: requestData.data[index],
                      ),
                    );
                  },
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
