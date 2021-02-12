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
  DateTime selectedDate;
  DateTime selectedTime;

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  final DateFormat timeFormat = DateFormat('HH:MM');

  _dataRequest() async {
    Dio dio = Dio();

    var postData = {
      '	data_solicitation': selectedDate,
      'time_solicitation': selectedTime,
    };

    var response = await dio.post(
      ApiConst.baseUrl + ApiConst.registerUrl,
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
                //   dateFormat.format(selectedDate),
                //   style: TextStyle(fontWeight: FontWeight.bold),
                // ),
                RaisedButton(
                  child: Text('choisissez la date et l\'heure '),
                  onPressed: () async {
                    final selectedDate = await _selectDateTime(context);
                    if (selectedDate == null) return;

                    print(selectedDate);

                    final selectedTime = await _selectTime(context);
                    if (selectedTime == null) return;
                    print(selectedTime);
                    setState(
                      () {
                        this.selectedDate = DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          // selectedTime.hour,
                          // selectedTime.minute,
                        );
                        this.selectedTime =
                            DateTime(selectedTime.hour, selectedTime.minute);
                      },
                    );
                  },
                ),
                Text(dateFormat.format(selectedDate)),
                Text(timeFormat.format(selectedTime)),
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

Future<TimeOfDay> _selectTime(BuildContext context) {
  final now = DateTime.now();

  return showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
  );
}

Future<DateTime> _selectDateTime(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(seconds: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
