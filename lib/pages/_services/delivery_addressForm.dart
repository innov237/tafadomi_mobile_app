import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:tafadomi/core/constantes/api_constante.dart';
import 'package:tafadomi/core/models/api_response.dart';
import 'dart:convert';
import 'package:tafadomi/core/palettes/colors_palette.dart';
import 'package:tafadomi/core/shared_service.dart';
import 'package:tafadomi/pages/_services/serviceForm_page.dart';

class DeliveryAddressForm extends StatefulWidget {
  final serviceData;
  DeliveryAddressForm({@required this.serviceData});
  static String routeName = '/DeliveryAddressForm';
  @override
  _DeliveryAddressFormState createState() => _DeliveryAddressFormState();
}

class _DeliveryAddressFormState extends State<DeliveryAddressForm> {
  TextEditingController quartier;
  TextEditingController number;
  var user;
  var userData;
  var serviceData;
  DeliveryAddressForm delivery;

  getUserData() async {
    var data = await PreferenceStorage.getDataFormPreferences("userData");
    setState(() {
      userData = json.decode(data);
    });
    _dataRequest(userData['data']);
  }

  @override
  void initState() {
    quartier = TextEditingController();
    number = TextEditingController();
    PreferenceStorage.saveDataToPreferences(
      'serviceData',
      json.encode(widget.serviceData),
    );
    super.initState();
  }

  _dataRequest(user) async {
    Dio dio = Dio();
    var postData = {
      'user_id': user['original']['user']['id'],
      'city_id': user['original']['user']['city']['id'],
      'quater': quartier.text,
      'phone_number': number.text,
    };

    var response = await dio.post(
      ApiConst.baseUrl + ApiConst.deliveryAddressUrl,
      data: postData,
    );

    if (response.statusCode == 200) {
      ApiResponse apiResponse = apiResponseFromJson(
        json.encode(response.data),
      );

      if (apiResponse.success) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ServiceForm(
            deliveryData: delivery,
          ),
        ));
        print("succes");
      } else {
        print(apiResponse.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: quartier,
                  decoration: InputDecoration(
                    labelText: "quartier",
                    suffixIcon: Icon(Icons.vpn_key_outlined),
                    focusColor: PaletteColor.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: number,
                  decoration: InputDecoration(
                    labelText: "telephone",
                    suffixIcon: Icon(Icons.vpn_key_outlined),
                    focusColor: PaletteColor.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  onPressed: () => getUserData(),
                  child: Text("suivant"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
