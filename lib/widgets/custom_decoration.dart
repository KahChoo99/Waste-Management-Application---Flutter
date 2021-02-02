import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration mainButtonBoxDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      blurRadius: 5,
      offset: Offset(5, 5), // changes position of shadow
    ),
  ],
);