import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:tafadomi/core/constantes/api_constante.dart';
import 'package:tafadomi/core/models/api_response.dart';
import 'dart:convert';
import 'package:tafadomi/core/palettes/colors_palette.dart';
import 'package:tafadomi/core/shared_service.dart';
import 'package:tafadomi/pages/_services/model/delivery_address_model.dart';

class ServiceForm extends StatefulWidget {
  static String routeName = '/ServiceForm';
  final deliveryData;
  ServiceForm({@required this.deliveryData});
  @override
  _ServiceFormState createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  String mydate;
  String myTime;
  var lastId;
  var serviceData;
  var service;
  DeliveryAddress deliveryD;
  var id;

  getServiceData() async {
    var datas = await PreferenceStorage.getDataFormPreferences("serviceData");
    setState(() {
      serviceData = json.decode(datas);
    });

    _dataRequest(serviceData);
  }

  Future<dynamic> _getlastdelivery() async {
    Dio dio = Dio();
    final responses =
        await dio.get(ApiConst.baseUrl + ApiConst.firstDeliveryUrl);

    if (responses.statusCode == 200) {
      ApiResponse apiResponse = apiResponseFromJson(
        json.encode(responses.data),
      );

      if (apiResponse.success) {
        setState(() {
          deliveryD = deliveryAddressFromJson(
            json.encode(responses.data),
          );
        });
      }
    }
    return json.encode(responses.data['data']['id']);
  }

  _dataRequest(service) async {
    Dio dio = Dio();

    var solicitationHr = DateFormat("hh:mm:ss").format(DateTime.now());
    print(solicitationHr);
    var postData = {
      'data_solicitation': mydate.toString(),
      'time_solicitation': myTime.toString(),
      'service_id': service['id'],
      'delivery_address_id': id,
      'user_id': widget.deliveryData,
      'solicitation_hour': solicitationHr,
    };

    var response = await dio.post(
      ApiConst.baseUrl + ApiConst.requestUrl,
      data: postData,
    );

    if (response.statusCode == 200) {
      ApiResponse apiResponse = apiResponseFromJson(
        json.encode(response.data),
      );

      if (apiResponse.success) {
        print("votre demande a bien été prise en compte");
      } else {
        print(apiResponse.message);
      }
    }
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDate: DateTime.now(),
    );

    if (date != null) {
      setState(() {
        mydate = date.year.toString().padLeft(2, '0') +
            '/' +
            date.month.toString().padLeft(2, '0') +
            '/' +
            date.day.toString();
      });
    }
  }

  _pickTime(context) async {
    TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        myTime = time.hour.toString() + ':' + time.minute.toString();
      });
    }
  }

  void initId() {
    _getlastdelivery().then((value) {
      setState(() {
        id = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    initId();
    super.initState();
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
                RaisedButton(
                  onPressed: () => _pickDate(),
                  child: Text("date de sollicitation"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  onPressed: () => _pickTime(context),
                  child: Text("heure de sollicitation"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  onPressed: () => getServiceData(),
                  child: Text("validez"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
