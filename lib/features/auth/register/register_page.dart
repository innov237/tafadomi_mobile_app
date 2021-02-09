import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tafadomi/core/constantes/api_constante.dart';
import 'package:tafadomi/core/models/api_response.dart';
import 'package:tafadomi/core/palettes/colors_palette.dart';

class RegisterPage extends StatefulWidget {
  static String routeName ="/register";
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _passwordController;
  TextEditingController _emailController;
  TextEditingController _userNameController;
  bool showLoader = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _userNameController = TextEditingController();
  }

  _register() async {
    Dio dio = Dio();

    var postData = {
      'email': _emailController.text,
      'passworl': _passwordController.text,
      'name':_userNameController.text,
    };

    if (_emailController.text.isEmpty || _passwordController.text.isEmpty || _userNameController.text.isEmpty) {
      print("veuillez renseigner tous les champs");
      return;
    }

    setState(() {
      showLoader = true;
    });

    var response = await dio.post(
      ApiConst.baseUrl + ApiConst.loginUrl,
      data: postData,
    );

    if (response.statusCode == 200) {
      ApiResponse apiResponse = apiResponseFromJson(
        json.encode(response.data),
      );

      if (apiResponse.success) {
        print("creation du compte éffectuée");
      } else {
        print(apiResponse.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 80,
                  child: Image.asset("assets/images/logo.png"),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Text(
                  "Procédez à votre ",
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  "Connexion",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 60.0,
                ),
                TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    labelText: "Nom",
                    suffixIcon: Icon(Icons.person),
                    focusColor: PaletteColor.primaryColor,
                    fillColor: PaletteColor.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    suffixIcon: Icon(Icons.vpn_key_outlined),
                    focusColor: PaletteColor.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Mot de passe",
                    suffixIcon: Icon(Icons.vpn_key_outlined),
                    focusColor: PaletteColor.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Container(
                  width: double.infinity,
                  height: 40.0,
                  child: RaisedButton(
                    color: PaletteColor.primaryColor,
                    elevation: 0.0,
                    onPressed: () => _register(),
                    child: Text(
                      "créer mon compte",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
