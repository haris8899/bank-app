import 'package:bank_flutter/data/data.dart';
import 'package:bank_flutter/utils/dimensions.dart';
import 'package:bank_flutter/widgets/large_text.dart';
import 'package:bank_flutter/widgets/small_text.dart';
import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {

  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: dataClass.mainlist.length,
                itemBuilder: (context, index) => InkWell(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: Dimensions.height10,
                            bottom: Dimensions.height10),
                        child: Row(children: [
                          Container(
                            width: Dimensions.height120,
                            height: Dimensions.height120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.BorderRadius15),
                                color: Colors.lightBlue,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      dataClass.mainlist[index]["image"]!,
                                    ))),
                          ),
                          Expanded(
                            child: Container(
                              //margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                              height: Dimensions.height100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 4,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.only(
                                  topRight:
                                      Radius.circular(Dimensions.BorderRadius15),
                                  bottomRight:
                                      Radius.circular(Dimensions.BorderRadius15),
                                ),
                              ),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    LargeText(
                                        text: dataClass.mainlist[index]['name']!),
                                    SizedBox(
                                      height: Dimensions.width10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            SmallText(text: DateTime.now().toString()),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Dimensions.width10,
                                    ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     TextIcon(
                                    //       icon: Icons.circle_sharp,
                                    //       text: 'Normal',
                                    //       iconColor: Colors.amber,
                                    //     ),
                                    //     TextIcon(
                                    //         icon: Icons.location_on,
                                    //         text: "1.7 Km",
                                    //         iconColor: Colors.red),
                                    //     TextIcon(
                                    //         icon: Icons.access_time_outlined,
                                    //         text: "20 min",
                                    //         iconColor: Colors.red),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    )),
      ),
    );
  }
}