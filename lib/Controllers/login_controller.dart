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

  Future<void> LoginWithEmail(TextEditingController emailController,
      TextEditingController passwordController, BuildContext context) async {
    var headers = {"Content-Type": "application/json"};
    try {
      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.loginMail);
      Map body = {
        "userId": emailController.text.trim(),
        "password": passwordController.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        var token = res["token"];
        prefs = await SharedPreferences.getInstance();
        print(JwtDecoder.decode(token));
        prefs.setString("token", token);
        Navigator.of(context).push(
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
}
