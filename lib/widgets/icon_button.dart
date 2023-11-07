import 'package:bank_flutter/utils/dimensions.dart';
import 'package:flutter/material.dart';

class BlueIconButton extends StatelessWidget {
  final IconData icon;
  const BlueIconButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Dimensions.height45,
        height: Dimensions.height45,
        child: Icon(icon, color: Colors.white, size: Dimensions.icon24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.BorderRadius15),
          color: Colors.blue,
        ),
      ),
    );
  }
}
