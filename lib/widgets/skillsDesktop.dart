import 'package:flutter/material.dart';
import 'package:porfolio/Constants/colors.dart';
import 'package:porfolio/Constants/skills_item.dart';

class Skillsdesktop extends StatelessWidget {
  const Skillsdesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // platforms
        ConstrainedBox(
          // ConstrainedBox is a widget that imposes additional constraints on its child.
          // It takes a BoxConstraints object that defines the constraints to be applied.
          constraints: BoxConstraints(
            maxWidth: 450,
          ),
          child: Wrap(
            // Creates a wrap layout.
            // By default, the wrap layout is horizontal and both the children and the runs are aligned to the start.
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              for (int i = 0; i < platformItems.length; i++)
                Container(
                  width: 200,
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
                )
            ],
          ),
        ),
        SizedBox(
          width: 50,
        ),

        // skills
        Flexible(
          // Flexible is a widget that allows a child to be flexible in size.
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 500,
            ),
            child: Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
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
          ),
        )
      ],
    );
  }
}
