import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:tafadomi/core/constantes/api_constante.dart';
import 'package:tafadomi/core/models/api_response.dart';
import 'dart:convert';

class ServiceForm extends StatefulWidget {
  static String routeName = '/ServiceForm';
  final serviceData;
  ServiceForm({@required this.serviceData});
  @override
  _ServiceFormState createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  //DateTime pickedDate;
  DateTime date;
  TimeOfDay time;

  // final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  // final DateFormat timeFormat = DateFormat('HH:MM');

  _dataRequest() async {
    Dio dio = Dio();

    var postData = {
      '	data_solicitation': date,
      'time_solicitation': time,
      //'service_id': myTime,
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
    date = await showDatePicker(
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
        String mydate = date.month.toString().padLeft(2, '0') +
            '/' +
            date.day.toString().padLeft(2, '0') +
            '/' +
            date.year.toString();
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
        String myTime = time.hour.toString() + ':' + time.minute.toString();
      });
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
                // Text(
                //   dateFormat.format(pickedDate),
                //   style: TextStyle(fontWeight: FontWeight.bold),
                // ),
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
                  onPressed: () => _dataRequest(),
                  child: Text("validez"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
