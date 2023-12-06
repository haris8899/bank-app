import 'dart:convert';
import 'dart:io';

import 'package:bank_flutter/Screens/Assets_page.dart';
import 'package:bank_flutter/utils/api_endpoints.dart';
import 'package:bank_flutter/utils/dimensions.dart';
import 'package:bank_flutter/widgets/large_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ImageController extends GetxController {
  Future<void> imageUpload(String imagepath) async {
    var postUri = Uri.parse(
        ApiEndpoints.baseUrl + ApiEndpoints.imageEndpoints.uploadimage);
    var request = http.MultipartRequest('POST', postUri);
    request.files.add(await http.MultipartFile.fromPath('picture', imagepath));
    var res = await request.send();
    if (res.statusCode == 200) {
      print("Uploaded");
      this.addImage(imagepath);
      showDialog(
              context: Get.context!,
              builder: (context) {
                return SimpleDialog(
                  children: [
                    Container(
                        padding: EdgeInsets.all(Dimensions.height10),
                        child: LargeText(
                          text: "File Uploaded",
                        ))
                  ],
                );
              })
          .then((value) => Navigator.of(Get.context!).pushReplacement(
              MaterialPageRoute(builder: (context) => AssetsPage())));
    }
  }

  Future<void> addImage(String imagepath) async {
    String filename = imagepath.split('/').last;
    int secondsSinceEpoch =
        DateTime.now().millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond;
    var headers = {"Content-Type": "application/json"};
    try {
      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.imageEndpoints.addimage);
      Map body = {
        "created_at": secondsSinceEpoch,
        "location_id": "1",
        "image_category_id": "1",
        "image_path": "uploads/" + filename,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        print("data added");
      } else {
        String error = jsonDecode(response.body)["error"];
        throw error;
      }
    } on Exception catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text(" Database Error"),
              contentPadding: EdgeInsets.all(Dimensions.height20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
