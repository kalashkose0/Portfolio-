import 'package:flutter/material.dart';
import 'package:porfolio/Constants/colors.dart';
import 'package:porfolio/widgets/siteLogo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, customColor.bgLight1],
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          Sitelogo(
            onTap: onLogoTap,
          ),
          Spacer(),
          IconButton(
            onPressed: onMenuTap,
            icon: Icon(Icons.menu),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
