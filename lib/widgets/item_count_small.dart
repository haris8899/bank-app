import 'package:bank_flutter/utils/dimensions.dart';
import 'package:bank_flutter/widgets/small_text.dart';
import 'package:flutter/material.dart';

class itemCountSmall extends StatefulWidget {
  int count;
  itemCountSmall({super.key, required this.count});

  @override
  State<itemCountSmall> createState() => _itemCountSmallState();
}

class _itemCountSmallState extends State<itemCountSmall> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(Dimensions.height10 / 2),
        decoration: BoxDecoration(
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.3),
          //     spreadRadius: 1,
          //     blurRadius: 10,
          //     offset: Offset(0, 3),
          //   ),
          // ],
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(Dimensions.height10),
        ),
        child: Row(
          children: [
            SmallText(
              text: widget.count.toString(),
              color: Colors.black,
            ),
            Icon(Icons.arrow_drop_down_outlined),
          ],
        ));
  }
}
