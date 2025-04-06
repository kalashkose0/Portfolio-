import 'package:flutter/material.dart';
import 'package:porfolio/Constants/colors.dart';

class MainMobileUserInfo extends StatelessWidget {
  const MainMobileUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      height: screenHeight,
      constraints: BoxConstraints(minHeight: 560),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // avta image
          Center(
            child: CircleAvatar(
              radius: 110,
              backgroundImage: AssetImage("assets/images/image.jpeg"),
              backgroundColor: Colors.transparent,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Hyy,\nI'm Kalash Kose\nFlutter Developer | Software Developer",
            style: TextStyle(
              fontSize: 24,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: customColor.whitePrimary,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber, // button background color
                foregroundColor: Colors.white, // text (and icon) color
                // minimumSize: Size(210, 20),
              ),
              child: Text(
                "Get in touch",
                style: TextStyle(
                  fontSize: 15,
                  height: 1.2,
                  fontWeight: FontWeight.bold,
                  color: customColor.whitePrimary,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
