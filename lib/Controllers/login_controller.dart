import 'dart:convert';

import 'package:bank_flutter/Screens/home_page.dart';
import 'package:bank_flutter/utils/api_endpoints.dart';
import 'package:bank_flutter/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> LoginWithEmail(TextEditingController emailController,
      TextEditingController passwordController,BuildContext context) async {
    var headers = {"Content-Type": "application/json"};
    try {
      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.loginMail);
      Map body = {
        "user": emailController.text.trim(),
        "password": passwordController.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        if (json["code"] == false) {
          throw ("Incorrect username or password");
        } else if (json["code"] == true) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));
        }
        ;
        //if (json["code"] == "true") {
        //   print("worked");
        //   var token = json["data"]["token"];
        //   // final SharedPreferences? prefs = await _prefs;
        //   // await prefs?.setString('token', token);
        //   emailController.clear();
        //   passwordController.clear();
        // } else if (json["code"] == 1) {
        //   throw jsonDecode(response.body)["message"];
        // } else {
        //   throw jsonDecode(response.body)["message"];
        // }
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text("Error"),
              contentPadding: EdgeInsets.all(Dimensions.height10),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
