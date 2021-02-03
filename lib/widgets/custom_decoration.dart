import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration mainButtonBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      blurRadius: 5,
      offset: Offset(5, 5), // changes position of shadow
    ),
  ],
);

BoxDecoration mainContainerBGBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      blurRadius: 5,
      offset: Offset(5, 5), // changes position of shadow
    ),
  ],
);