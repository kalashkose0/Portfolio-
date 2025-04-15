import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:porfolio/Constants/colors.dart';
import 'package:porfolio/Constants/navTitleItems.dart';
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

            // skill
            Container(
              height: 500,
              width: double.maxFinite,
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
