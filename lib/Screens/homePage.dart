import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:porfolio/Constants/colors.dart';
import 'package:porfolio/Constants/skills_item.dart';
import 'package:porfolio/utils/projects_utils.dart';
import 'package:porfolio/widgets/drawerMobile.dart';
import 'package:porfolio/widgets/headerDesktop.dart';
import 'package:porfolio/widgets/headerMobile.dart';
import 'package:porfolio/widgets/mainDesktop_userinfo.dart';
import 'package:porfolio/widgets/mainMobileUserInfo.dart';
import 'package:porfolio/widgets/skillsDesktop.dart';
import 'package:porfolio/widgets/skilsMobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  final ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 600;
        final isWide = constraints.maxWidth >= 800;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: customColor.ScaffoldBg,
          endDrawer: isDesktop ? null : DrawerMobile(),
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  key: homeKey,
                ),
                // Header
                isDesktop
                    ? const HeaderDesktop()
                    : HeaderMobile(
                        onLogoTap: () {},
                        onMenuTap: () {
                          scaffoldKey.currentState?.openEndDrawer();
                        },
                      ),

                // User Info
                isDesktop
                    ? const MaindesktopUserinfo()
                    : const MainMobileUserInfo(),

                const SizedBox(height: 5),

                // Skills Section
                Container(
                  key: skillsKey,
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: customColor.bgLight1,
                  child: Column(
                    children: [
                      Text(
                        "What I can do",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: customColor.whitePrimary,
                        ),
                      ),
                      const SizedBox(height: 50),
                      isWide ? const Skillsdesktop() : const Skilsmobile(),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Projects Section
                Container(
                  key: projectsKey,
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: customColor.bgLight1,
                  child: Column(
                    children: [
                      Text(
                        "Work Projects",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: customColor.whitePrimary,
                        ),
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
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

                const SizedBox(height: 50),

                // Contact Section
                Container(
                  color: const Color(0xFF1A1E2D),
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Get in touch',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Name & Email Fields
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        alignment: WrapAlignment.center,
                        children: [
                          _buildInputField(hint: "Your name", width: 300),
                          _buildInputField(hint: "Your email", width: 300),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Message Field
                      _buildInputField(
                          hint: "Your message", maxLines: 8, width: 640),

                      const SizedBox(height: 20),

                      // Submit Button
                      SizedBox(
                        width: 640,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF8A51B),
                            padding: const EdgeInsets.symmetric(vertical: 18),
                          ),
                          child: const Text(
                            "Get in touch",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Social Icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialIcon("assets/images/github.png"),
                          _buildSocialIcon("assets/images/linkedin.png"),
                          _buildSocialIcon("assets/images/facebook.png"),
                          _buildSocialIcon("assets/images/instagram.png"),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ========== Helper Widgets ==========

Widget buildProjectCard(ProjectUtils project) {
  return Container(
    width: 280,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    decoration: BoxDecoration(
      color: Colors.grey.shade900,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
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
            style: const TextStyle(
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
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Available on: ",
                style: TextStyle(color: Colors.orangeAccent, fontSize: 12),
              ),
              ...project.platforms.map((platform) {
                IconData icon;
                if (platform == 'android') {
                  icon = Icons.android;
                } else if (platform == 'ios') {
                  icon = Icons.apple;
                } else {
                  icon = Icons.language;
                }
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(icon, size: 18, color: Colors.white),
                );
              }).toList(),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildInputField({
  required String hint,
  double width = 300,
  int maxLines = 1,
}) {
  return SizedBox(
    width: width,
    child: TextField(
      maxLines: maxLines,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Widget _buildSocialIcon(String imagePath) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: GestureDetector(
      onTap: () {
        // Add URL launcher or action
      },
      child: Image.asset(
        imagePath,
        width: 30,
        height: 30,
        fit: BoxFit.contain,
      ),
    ),
  );
}
