import 'package:bank_flutter/CameraManagement/take_picture_controller.dart';
import 'package:bank_flutter/utils/dimensions.dart';
import 'package:bank_flutter/widgets/large_text.dart';
import 'package:bank_flutter/widgets/menu_list.dart';
import 'package:flutter/material.dart';

class AssetsPage extends StatefulWidget {
  const AssetsPage({super.key});

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Assets")),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left:Dimensions.height20,right: Dimensions.height20),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.height10,
              ),
              Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LargeText(text: "Update Assets"),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => TakePictureController())),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(
                                  Dimensions.BorderRadius15),
                            ),
                            padding: EdgeInsets.all(Dimensions.height10),
                            child: Icon(Icons.camera_alt_outlined,color: Colors.white,)
                          ),
                        ),
                      ],
                    ),
                  ),
                  //MenuList()
                ],
              ),
              MenuList(),
            ],
          ),
        ),
      ),
    );
  }
}
