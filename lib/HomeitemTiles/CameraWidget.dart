import 'package:bank_flutter/widgets/large_text.dart';
import 'package:bank_flutter/widgets/small_text.dart';
import 'package:flutter/material.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key});

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LargeText(text: "Assets Management"),
          SmallText(text: "Next Assets check is due"),

        ],
      ),
    );
  }
}