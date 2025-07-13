import 'package:flutter/material.dart';
import 'package:porfolio/Constants/colors.dart';

class MaindesktopUserinfo extends StatelessWidget {
  const MaindesktopUserinfo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: screenHeight / 1.2,
      constraints: BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hyy,\nI'm Kalash Kose\nFlutter Developer | Software Developer",
                style: TextStyle(
                  fontSize: 30,
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
                      fontSize: 18,
                      height: 2,
                      fontWeight: FontWeight.bold,
                      color: customColor.whitePrimary,
                    ),
                  ),
                ),
              )
            ],
          ),
          CircleAvatar(
            radius: 180,
            backgroundImage: AssetImage("assets/images/kalash.jpeg"),
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
