import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArrowBackPop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: 40,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}