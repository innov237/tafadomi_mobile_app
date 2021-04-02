import 'package:flutter/material.dart';
import 'package:tafadomi/pages/_services/model/model_request.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class RequestHistoricalWidget extends StatefulWidget {
  final requestData;
  RequestHistoricalWidget({this.requestData});
  @override
  _RequestHistoricalWidgetState createState() =>
      _RequestHistoricalWidgetState();
}

class _RequestHistoricalWidgetState extends State<RequestHistoricalWidget> {
  @override
  Widget build(BuildContext context) {
    return requestHistorical(widget.requestData);
  }

  Widget requestHistorical(request) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.requestData.serviceAsk.name),
                Text(
                  "status",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              DateFormat('yyyy/MM/dd')
                  .format(widget.requestData.serviceAsk.createdAt),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
