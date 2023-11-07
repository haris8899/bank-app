import 'package:bank_flutter/CameraManagement/take_picture_controller.dart';
import 'package:bank_flutter/utils/dimensions.dart';
import 'package:bank_flutter/widgets/large_text.dart';
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
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(Dimensions.height30),
          child: Column(
            children: [
              SizedBox(height: Dimensions.height45,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LargeText(text: "Assets"),
                      InkWell(
                        onTap:()=> Navigator.of(context)
                        .push(
                          MaterialPageRoute(
                            builder: (context)=>TakePictureController()
                          )
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(Dimensions.BorderRadius15),
                          ),
                          padding: EdgeInsets.all(Dimensions.height10),
                          child: LargeText(text: "Take Picture",color: Colors.white,),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}