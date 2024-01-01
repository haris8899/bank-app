import 'dart:convert';

import 'package:bank_flutter/Screens/home_page.dart';
import 'package:bank_flutter/user_management/user_frame.dart';
import 'package:bank_flutter/utils/api_endpoints.dart';
import 'package:bank_flutter/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late SharedPreferences prefs;

  Future<void> LoginWithUserID(TextEditingController emailController,
      TextEditingController passwordController, BuildContext context) async {
    var headers = {"Content-Type": "application/json"};
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("loading"),
            contentPadding: EdgeInsets.all(Dimensions.height20),
            children: [CircularProgressIndicator()],
          );
        });
    try {
      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.loginMail);
      Map body = {
        "userId": emailController.text.trim(),
        "password": passwordController.text,
      };
      http.Response response = await http
          .post(url, body: jsonEncode(body), headers: headers)
          .timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          Navigator.pop(context);
          return http.Response('Internal server error', 500);
        },
      );
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        var token = res["token"];
        prefs = await SharedPreferences.getInstance();
        prefs.setString("token", token);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => UserFrame(token: token)));
      } else {
        String error = jsonDecode(response.body)["error"];
        throw error;
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text("Error"),
              contentPadding: EdgeInsets.all(Dimensions.height20),
              children: [Text(e.toString())],
            );
          });
    }
  }

  Future<void> logout(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => UserFrame(token: null)));
  }
}
