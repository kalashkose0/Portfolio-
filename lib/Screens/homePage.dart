import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:porfolio/Constants/colors.dart';
import 'package:porfolio/Constants/navTitleItems.dart';
import 'package:porfolio/Constants/skills_item.dart';
import 'package:porfolio/widgets/drawerMobile.dart';
import 'package:porfolio/widgets/headerDesktop.dart';
import 'package:porfolio/widgets/headerMobile.dart';
import 'package:porfolio/widgets/mainDesktop_userinfo.dart';
import 'package:porfolio/widgets/mainMobileUserInfo.dart';
import 'package:porfolio/widgets/siteLogo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<String> navTitle = [
  //   "Home",
  //   "Skills",
  //   "Project",
  //   "Contact",
  //   "Blog",
  // ];
  //
  @override
  Widget build(BuildContext context) {
    final ScaffoldKey = GlobalKey<ScaffoldState>();
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(builder: (context, Constraints) {
      return Scaffold(
        key: ScaffoldKey,
        backgroundColor: customColor.ScaffoldBg,
        endDrawer: Constraints.maxWidth >= 600 ? null : DrawerMobile(),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            // main
            if (Constraints.maxWidth >= 600)
              HeaderDesktop()
            else
              HeaderMobile(
                onLogoTap: () {},
                onMenuTap: () {
                  ScaffoldKey.currentState?.openEndDrawer();
                },
              ),
            if (Constraints.maxWidth >= 600)
              MaindesktopUserinfo()
            else
              MainMobileUserInfo(),
            SizedBox(
              height: 5,
            ),

            // skill
            Container(
              width: screenWidth,
              padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
              color: customColor.bgLight1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "What I can do",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: customColor.whitePrimary,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 16),
                                  backgroundColor: customColor.bgLight2,
                                  label: Text("${skillItem[i]["title"]}"),
                                  avatar: Image.asset("${skillItem[i]["img"]}"),
                                )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // Project
            Container(
              height: 500,
              width: double.maxFinite,
              color: Colors.blueGrey,
            ),
            // Contact
            Container(
              height: 500,
              width: double.maxFinite,
            ),
            // Footer
            Container(
              height: 500,
              width: double.maxFinite,
              color: Colors.blueGrey,
            ),
          ],
        ),
      );
    });
  }
}
