import 'package:bank_flutter/utils/dimensions.dart';
import 'package:bank_flutter/widgets/small_text.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _EpandableTextState();
}

class _EpandableTextState extends State<ExpandableText> {
  late String FirstHalf;
  late String SecondHalf;
  bool hiddentext = true;
  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      FirstHalf = widget.text.substring(0, textHeight.toInt());
      SecondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      FirstHalf = widget.text;
      SecondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SecondHalf.isEmpty
          ? SmallText(
              text: FirstHalf,
              size: Dimensions.font16,
              color: Colors.black,
              height: 1.8,
            )
          : Column(
              children: [
                SmallText(
                  text:
                      hiddentext ? (FirstHalf + "...") : FirstHalf + SecondHalf,
                  size: Dimensions.font16,
                  color: Colors.black,
                  height: 1.8,
                ),
                InkWell(
                  child: Row(children: [
                    SmallText(
                      text: hiddentext ? "Show More" : "Show Less",
                      color: Colors.blue,
                    ),
                    Icon(
                      hiddentext ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                      color: Colors.blue,
                    ),
                  ]),
                  onTap: () {
                    setState(() {
                      hiddentext = !hiddentext;
                    });
                  },
                )
              ],
            ),
    );
  }
}
