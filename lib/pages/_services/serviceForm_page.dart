import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:tafadomi/core/constantes/api_constante.dart';
import 'package:tafadomi/core/models/api_response.dart';
import 'dart:convert';
import 'package:tafadomi/core/palettes/colors_palette.dart';
import 'package:tafadomi/core/shared_service.dart';

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
  var serviceData;
  var service;

  getServiceData() async {
    var datas = await PreferenceStorage.getDataFormPreferences("serviceData");
    setState(() {
      serviceData = json.decode(datas);
    });
    _dataRequest(serviceData);
  }

  _dataRequest(service) async {
    print(widget.deliveryData);
    Dio dio = Dio();

    var postData = {
      'data_solicitation': mydate.toString(),
      'time_solicitation': myTime.toString(),
      'service_id': service['id'],
      'delivery_address_id': widget.deliveryData.id,
    };

    var response = await dio.post(
      ApiConst.baseUrl + ApiConst.serviceRequestUrl,
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

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   getServiceData();
  //   print(widget.serviceData);
  //   super.initState();
  // }

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
