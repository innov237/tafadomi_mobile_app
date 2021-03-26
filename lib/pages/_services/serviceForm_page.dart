import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:tafadomi/core/constantes/api_constante.dart';
import 'package:tafadomi/core/models/api_response.dart';
import 'dart:convert';
import 'package:tafadomi/core/palettes/colors_palette.dart';

class ServiceForm extends StatefulWidget {
  static String routeName = '/ServiceForm';
  final serviceData;
  ServiceForm({@required this.serviceData});
  @override
  _ServiceFormState createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  List listItem = ["item1", "item2", "item3"];
  String valueChoose;
  String mydate;
  String myTime;
  TextEditingController quartier;
  TextEditingController number;

  _dataRequest() async {
    Dio dio = Dio();

    var postData = {
      'data_solicitation': mydate.toString(),
      'time_solicitation': myTime.toString(),
      'service_id': widget.serviceData['id'],
      'quater': quartier.text,
      'phone_number': number.text,
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

  @override
  void initState() {
    // TODO: implement initState
    print(widget.serviceData);
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
                  controller: quartier,
                  decoration: InputDecoration(
                    labelText: "telephone",
                    suffixIcon: Icon(Icons.vpn_key_outlined),
                    focusColor: PaletteColor.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text("dans quelle ville le service doit il etre rendu ?"),
                DropdownButton(
                  hint: Text("choix"),
                  dropdownColor: Colors.grey,
                  underline: SizedBox(),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  style: TextStyle(color: Colors.black, fontSize: 22),
                  value: valueChoose,
                  onChanged: (newValue) {
                    setState(() {
                      valueChoose = newValue;
                    });
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  onPressed: () => _dataRequest(),
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
