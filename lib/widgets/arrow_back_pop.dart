import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waste_management/constants/values.dart';

class ArrowBackPop extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const ArrowBackPop({this.screenWidth, this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        width: 70 * screenWidth / dDemoWidth,
        height: 55 * screenHeight / dDemoHeight,
        margin: EdgeInsets.fromLTRB(0, 40 * screenHeight / dDemoHeight, 0, 0),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
            size: 40 * screenWidth / dDemoWidth,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}