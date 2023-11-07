import 'package:bank_flutter/utils/dimensions.dart';
import 'package:flutter/material.dart';

class ActionIconButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color IconColor;
  final double size;
  final double iconSize;
  ActionIconButton({
    super.key,
    required this.icon,
    this.backgroundColor = Colors.white,
    this.IconColor = Colors.black38,
    this.size = 40,
    this.iconSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundColor.withOpacity(0.7),
      ),
      child: Icon(
        icon,
        color: IconColor,
        size: iconSize == 16 ? Dimensions.icon16 : iconSize,
      ),
    );
  }
}
