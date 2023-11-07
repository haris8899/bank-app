import 'dart:io';

import 'package:bank_flutter/Screens/Assets_page.dart';
import 'package:bank_flutter/utils/api_endpoints.dart';
import 'package:bank_flutter/utils/dimensions.dart';
import 'package:bank_flutter/widgets/large_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class UploadImageController extends GetxController {
  Future<void> imageUpload(String imagepath) async {
    // String filename = imagepath.split('/').last;
    var postUri = Uri.parse(
        ApiEndpoints.baseUrl + ApiEndpoints.imageEndpoints.uploadimage);
    var request = http.MultipartRequest('POST', postUri);
    request.files.add(await http.MultipartFile.fromPath('picture', imagepath));
    var res = await request.send();
    if (res.statusCode == 200) {
      print("Uploaded");
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              children: [
                Container(
                  padding: EdgeInsets.all(Dimensions.height10),
                  child:  LargeText (text: "File Uploaded",))
                ],

            );
          }).then((value) => Navigator.of(Get.context!).pushReplacement(MaterialPageRoute(builder: (context) => AssetsPage())));
    }
  }
}
