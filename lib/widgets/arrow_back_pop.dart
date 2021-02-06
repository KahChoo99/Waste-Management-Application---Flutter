import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArrowBackPop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        width: 80,
        height: 80,
        margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: IconButton(
          // padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}