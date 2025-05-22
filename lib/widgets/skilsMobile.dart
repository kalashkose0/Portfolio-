import 'package:flutter/material.dart';
import 'package:porfolio/Constants/colors.dart';
import 'package:porfolio/Constants/skills_item.dart';

class Skilsmobile extends StatelessWidget {
  const Skilsmobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      // ConstrainedBox is a widget that imposes additional constraints on its child.
      constraints: BoxConstraints(
        maxWidth: 500,
      ),
      child: Column(
        children: [
          // platforms
          for (int i = 0; i < platformItems.length; i++)
            Container(
              margin: EdgeInsets.only(bottom: 5),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: customColor.bgLight2,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                leading: Image.asset(
                  platformItems[i]["img"],
                  width: 26,
                ),
                title: Text(platformItems[i]["title"]),
              ),
            ),
          SizedBox(
            height: 50,
          ),
          // skills
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            alignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < skillItem.length; i++)
                Chip(
                  // A Chip is a small element that represents an input, attribute, or action.
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  backgroundColor: customColor.bgLight2,
                  label: Text("${skillItem[i]["title"]}"),
                  avatar: Image.asset("${skillItem[i]["img"]}"),
                )
            ],
          ),
        ],
      ),
    );
  }
}
