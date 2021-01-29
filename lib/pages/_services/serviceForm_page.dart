import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ServiceForm extends StatefulWidget {
  static String routeName = '/ServiceForm';
  @override
  _ServiceFormState createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  DateTime selectedDate = DateTime.now();
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd  HH:MM');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Column(
              children: <Widget>[
                Text(
                  dateFormat.format(selectedDate),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                RaisedButton(
                  child: Text('choisissez la date et l\'heure '),
                  onPressed: () async {
                    final selectedDate = await _selectDateTime(context);
                    if (selectedDate == null) return;

                    print(selectedDate);

                    final selectedTime = await _selectTime(context);
                    if (selectedTime == null) return;
                    print(selectedTime);
                    setState(() {
                      this.selectedDate = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );
                    });
                  },
                ),
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
