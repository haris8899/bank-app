import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:bank_flutter/Controllers/image_controller.dart';
import 'package:bank_flutter/utils/api_endpoints.dart';
import 'package:bank_flutter/utils/dimensions.dart';
import 'package:bank_flutter/widgets/large_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: Container(
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.file(File(imagePath)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tag"),
                    DropdownButton(
                        items: <String>[
                          'Branch Counter',
                          'Branch ATM room',
                          'Server Room',
                          'Network room'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) => {})
                  ],
                ),
              ),
              InkWell(
                onTap: () async => await ImageController().imageUpload(imagePath),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(Dimensions.BorderRadius15),
                  ),
                  padding: EdgeInsets.all(Dimensions.height10),
                  margin: EdgeInsets.all(Dimensions.height10),
                  child: Center(
                      child: LargeText(
                    text: "Upload",
                    color: Colors.white,
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
