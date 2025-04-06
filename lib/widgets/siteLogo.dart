import 'package:flutter/material.dart';
import 'package:porfolio/Constants/colors.dart';

class Sitelogo extends StatelessWidget {
  const Sitelogo({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        "Kk",
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            color: customColor.yellowSecondary),
      ),
    );
  }
}
