import 'package:flutter/material.dart';
import 'package:porfolio/Constants/colors.dart';
import 'package:porfolio/Constants/navTitleItems.dart';
import 'package:porfolio/widgets/siteLogo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key, required this.onNavMenuTap});
  final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, customColor.bgLight1],
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          Sitelogo(
            onTap: () {},
          ),
          Spacer(),
          for (int i = 0; i < navTitle.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: () {
                  onNavMenuTap(i);
                  // Optionally, you can add navigation logic here
                },
                child: Text(
                  navTitle[i],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: customColor.whitePrimary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
