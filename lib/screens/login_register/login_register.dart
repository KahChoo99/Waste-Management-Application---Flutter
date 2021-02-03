import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/screens/login_register/user/user_login.dart';
import 'package:waste_management/screens/login_register/user/user_register_username.dart';
import 'package:waste_management/screens/login_register/admin/admin_login.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/custom_decoration.dart';

class LoginRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    Column buttonList = Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
          decoration: mainButtonBoxDecoration,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minWidth: 220,
            height: 50,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserLogin()),
              );
            },
            color: buttonBlue,
            child: Text(sUserLogin,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            textColor: Colors.black,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
          decoration: mainButtonBoxDecoration,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minWidth: 220,
            height: 50,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserRegisterUsername()),
              );
            },
            color: buttonBlue,
            child: Text(sUserRegister,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            textColor: Colors.black,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
          decoration: mainButtonBoxDecoration,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minWidth: 220,
            height: 50,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminLogin()),
              );
            },
            color: buttonBlue,
            child: Text(sAdminLogin,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            // textColor: Colors.black,
          ),
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          BackgroundPainter(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/icon/apps_icon.png",
                height: 200,
              ),
              Text(sAppTitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              SizedBox(
                height: 16,
              ),
              Container(
                width: screenWidth,
                margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                decoration: mainContainerBGBoxDecoration,
                child: buttonList,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
