import 'package:flutter/material.dart';
import 'package:tafadomi/pages/categories/models/categorie_model.dart';

class CategorieWidget extends StatefulWidget {
  final categorieData;
  CategorieWidget({@required this.categorieData});
  @override
  _CategorieWidgetState createState() => _CategorieWidgetState();
}

class _CategorieWidgetState extends State<CategorieWidget> {
  @override
  Widget build(BuildContext context) {
    return buildCategory(widget.categorieData);
  }

  Widget buildCategory(Catrgorie categotie) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Card(
          child: Column(
            children: [
              Container(
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/cleaning.png"),
                ),
              ),
              SizedBox(
                height: 9.0,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(widget.categorieData.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
