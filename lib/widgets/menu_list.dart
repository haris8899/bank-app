import 'package:bank_flutter/Controllers/image_controller.dart';
import 'package:bank_flutter/data/data.dart';
import 'package:bank_flutter/utils/dimensions.dart';
import 'package:bank_flutter/widgets/large_text.dart';
import 'package:bank_flutter/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../models/image_data_model.dart';

class MenuList extends StatefulWidget {
  const MenuList({super.key});
  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  Future<List<ImageData>> dataList() async {
    setState(() {});
    List<ImageData> datalist = [];
    List<dynamic> dataRaw = await ImageController().getImageList();
    for (var D in dataRaw) {
      print(D);
      ImageData data = new ImageData(
          imageId: D['image_id'],
          createdAt: D['created_at'],
          locationId: D['location_id'],
          imageCategoryId: D['image_category_id'],
          imagePath: D['image_path']);
      print(data.getCreatedAt);
      print(data.getImageCategoryId);
      datalist.add(data);
    }
    return datalist;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          child: FutureBuilder(
              future: dataList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  // Data fetched successfully
                  List<ImageData> imagelist = snapshot.data!;
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: imagelist.length,
                      itemBuilder: (context, index) => InkWell(
                            child: InkWell(
                              onTap: dataList,
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
                                              dataClass.mainlist[index]
                                                  ["image"]!,
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
                                          topRight: Radius.circular(
                                              Dimensions.BorderRadius15),
                                          bottomRight: Radius.circular(
                                              Dimensions.BorderRadius15),
                                        ),
                                      ),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            LargeText(
                                              text: imagelist[index]
                                                  .getImageCategoryId,
                                            ),
                                            SizedBox(
                                              height: Dimensions.width10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    SmallText(
                                                      text: imagelist[index]
                                                          .getCreatedAt,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: Dimensions.width10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ));
                }
              })),
    );
  }
}
