import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tafadomi/core/constantes/api_constante.dart';
import 'package:tafadomi/core/models/api_response.dart';
import 'package:tafadomi/core/shared_service.dart';
import 'package:tafadomi/core/palettes/colors_palette.dart';
import 'package:dio/dio.dart';
import 'package:tafadomi/features/auth/register/register_page.dart';
import 'package:tafadomi/pages/tabs_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordController;
  TextEditingController _emailController;
  bool showLoader = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  _login() async {
    Dio dio = Dio();

    var postData = {
      'email': _emailController.text,
      'password': _passwordController.text,
    };

    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
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
      print(response.data['data']['original']['access_token']);

      if (apiResponse.success) {
        PreferenceStorage.saveDataToPreferences(
          'userData',
          json.encode(response.data),
        );
        Navigator.of(context).pushNamed(
          TabsPage.routeName,
        );

        print("bien connecté");
      } else {
        print(apiResponse.message);
      }
    }
  }

  getToken() async {}

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
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    RegisterPage.routeName,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Register"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
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
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Nom de l'utilisateur",
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
                    onPressed: () => _login(),
                    child: Text(
                      "connexion",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                      child: Text(
                    "Mot de passe oublié ?",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
