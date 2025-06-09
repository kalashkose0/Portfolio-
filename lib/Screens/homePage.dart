import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:porfolio/Constants/colors.dart';
import 'package:porfolio/Constants/navTitleItems.dart';
import 'package:porfolio/Constants/skills_item.dart';
import 'package:porfolio/utils/projects_utils.dart';
import 'package:porfolio/widgets/drawerMobile.dart';
import 'package:porfolio/widgets/headerDesktop.dart';
import 'package:porfolio/widgets/headerMobile.dart';
import 'package:porfolio/widgets/mainDesktop_userinfo.dart';
import 'package:porfolio/widgets/mainMobileUserInfo.dart';
import 'package:porfolio/widgets/siteLogo.dart';
import 'package:porfolio/widgets/skillsDesktop.dart';
import 'package:porfolio/widgets/skilsMobile.dart';

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
                  // platforms and skills
                  if (Constraints.maxWidth >= 800)
                    Skillsdesktop()
                  else
                    Skilsmobile(),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Project
            Container(
              width: screenWidth,
              padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
              color: customColor.bgLight1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Work Projects",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: customColor.whitePrimary,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 350,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: projectList.length,
                      itemBuilder: (context, index) {
                        return buildProjectCard(projectList[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            // hobby projects
            Center(
              child: Container(
                width: screenWidth,
                padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: customColor.bgLight1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Hobby Projects",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: customColor.whitePrimary,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    // platforms and skills
                    if (Constraints.maxWidth >= 800)
                      Skillsdesktop()
                    else
                      Skilsmobile(),
                  ],
                ),
              ),
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

Widget buildProjectCard(ProjectUtils project) {
  return Container(
    width: 280,
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    decoration: BoxDecoration(
      color: Colors.grey.shade900,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          child: Image.asset(
            project.imagePath,
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            project.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            project.description,
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the bottom row content
            children: [
              Text(
                "Available on: ",
                style: TextStyle(color: Colors.orangeAccent, fontSize: 12),
              ),
              ...project.platforms.map((platform) {
                IconData icon;
                if (platform == 'android')
                  icon = Icons.android;
                else if (platform == 'ios')
                  icon = Icons.apple;
                else
                  icon = Icons.language;

                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(icon, size: 18, color: Colors.white),
                );
              }).toList()
            ],
          ),
        ),
      ],
    ),
  );
}
