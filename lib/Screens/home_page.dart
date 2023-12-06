import 'package:bank_flutter/CameraManagement/take_picture_controller.dart';
import 'package:bank_flutter/Controllers/login_controller.dart';
import 'package:bank_flutter/Screens/Assets_page.dart';
import 'package:bank_flutter/HomeitemTiles/CameraWidget.dart';
import 'package:bank_flutter/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var Items = [CameraWidget(), Text("Inventory"), Text("Financial"),Text("Branch Data")];
    var ItemClick = ["/Assets"];
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Colors.blue[700]),
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: Dimensions.height80,
        ),
        Padding(
          padding: EdgeInsets.all(Dimensions.height20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dashboard",
                    style: TextStyle(
                        color: Colors.white, fontSize: Dimensions.height30),
                  ),
                  InkWell(
                    onTap: ()async => await LoginController().logout(context),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(Dimensions.BorderRadius15),
                      ),
                      padding: EdgeInsets.all(Dimensions.height10),
                      child: Icon(Icons.logout,
                      )
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
            ],
          ),
        ),
        Expanded(
            child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.BorderRadius15),
                  topRight: Radius.circular(Dimensions.BorderRadius15))),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.all(Dimensions.height20),
            child: Column(children: [
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: Items.length,
                  itemBuilder: (context, int index) {
                    return InkWell(
                      onTap:()=> Navigator.of(context).pushNamed(ItemClick[index]),
                      child: Container(
                        padding: EdgeInsets.all(Dimensions.height20),
                        margin: EdgeInsets.all(Dimensions.height10),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius:
                              BorderRadius.circular(Dimensions.BorderRadius15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 8,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                          // border: Border(),
                        ),
                        child: Items[index],
                      ),
                    );
                  })
            ]),
          )),
        ))
      ]),
    ));
  }
}
