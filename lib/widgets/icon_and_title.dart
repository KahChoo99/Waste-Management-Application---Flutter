import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconAndTitle extends StatelessWidget {
  final double screenWidth;
  final double demoWidth;

  const IconAndTitle({this.screenWidth, this.demoWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Image.asset(
              "assets/icon/apps_icon.png",
            ),
          ),
          Expanded(
            flex: 6,
            child: BorderedText(
              strokeWidth: 0.5,
              child: Text("Solid Waste Management",
                  style: TextStyle(
                      decorationColor: Colors.black,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(5, 5),
                        ),
                      ],
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30 * screenWidth / demoWidth)),
            ),
          ),
        ],
      ),
    );
  }
}
