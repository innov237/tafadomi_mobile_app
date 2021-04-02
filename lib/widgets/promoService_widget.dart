import 'package:flutter/material.dart';
import 'package:tafadomi/core/palettes/colors_palette.dart';
import 'package:tafadomi/pages/_services/delivery_addressForm.dart';

class ServicePromoWidget extends StatefulWidget {
  final promoServiceData;

  ServicePromoWidget({@required this.promoServiceData});

  @override
  _ServicePromoWidgetState createState() => _ServicePromoWidgetState();
}

class _ServicePromoWidgetState extends State<ServicePromoWidget> {
  @override
  Widget build(BuildContext context) {
    return promocard();
  }

  Widget promocard() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              width: 200.0,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120.0,
                          width: 170.0,
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/cleaning.png"),
                          ),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 73.0),
                          child: Text(
                            widget.promoServiceData.service.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: Text(
                            "A partir de : " +
                                widget.promoServiceData.service.minimalPrice +
                                " FCFA",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        //   child: Text(
                        //     widget.promoServiceData['description'],
                        //     style: TextStyle(fontSize: 13.0),
                        //   ),
                        // ),
                        SizedBox(
                          height: 3.0,
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        width: double.infinity,
                        height: 40.0,
                        child: RaisedButton(
                          padding: EdgeInsets.zero,
                          elevation: 0.0,
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DeliveryAddressForm(
                                serviceData: widget.promoServiceData,
                              ),
                            ),
                          ),
                          child: Text(
                            "commander",
                            style: TextStyle(
                                color: Color(0xFF44D7F1),
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0),
                          ),
                          color: Color(0xFF372e5a),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0.0,
          child: Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              border: Border.all(color: PaletteColor.secondaryColor),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                widget.promoServiceData.reduction + "%",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
