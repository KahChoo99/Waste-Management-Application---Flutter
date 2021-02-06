import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/constants/values.dart';
import 'package:waste_management/screens/login_register/user/user_login.dart';
import 'package:waste_management/screens/login_register/user/user_register_username.dart';
import 'package:waste_management/screens/login_register/admin/admin_login.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/custom_decoration.dart';

class LoginRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double widthRatio = screenWidth / dDemoWidth;
    double heightRatio = screenHeight / dDemoHeight;

    Column buttonList = Column(
      children: [
        SizedBox(
          height: 50 * heightRatio,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
            50 * widthRatio,
            10 * heightRatio,
            50 * widthRatio,
            10 * heightRatio,
          ),
          decoration: mainButtonBoxDecoration,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0 * heightRatio),
            ),
            minWidth: 220 * widthRatio,
            height: 50 * heightRatio,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserLogin()),
              );
            },
            color: buttonBlue,
            child: Text(
              sUserLogin,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24 * widthRatio,
              ),
            ),
            textColor: Colors.black,
          ),
        ),
        SizedBox(
          height: 50 * heightRatio,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
            50 * widthRatio,
            10 * heightRatio,
            50 * widthRatio,
            10 * heightRatio,
          ),
          decoration: mainButtonBoxDecoration,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0 * heightRatio),
            ),
            minWidth: 220 * widthRatio,
            height: 50 * heightRatio,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserRegisterUsername()),
              );
            },
            color: buttonBlue,
            child: Text(
              sUserRegister,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24 * widthRatio,
              ),
            ),
            textColor: Colors.black,
          ),
        ),
        SizedBox(
          height: 50 * heightRatio,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
            50 * widthRatio,
            10 * heightRatio,
            50 * widthRatio,
            10 * heightRatio,
          ),
          decoration: mainButtonBoxDecoration,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0 * heightRatio),
            ),
            minWidth: 220 * widthRatio,
            height: 50 * heightRatio,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminLogin()),
              );
            },
            color: buttonBlue,
            child: Text(
              sAdminLogin,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24 * widthRatio,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50 * heightRatio,
        ),
      ],
    );
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            BackgroundPainter(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50 * heightRatio,
                ),
                Image.asset(
                  "assets/icon/apps_icon.png",
                  height: 200 * heightRatio,
                ),
                Text(
                  sAppTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24 * widthRatio,
                  ),
                ),
                SizedBox(
                  height: 16 * heightRatio,
                ),
                SingleChildScrollView(
                  child: Container(
                    width: screenWidth,
                    margin: EdgeInsets.fromLTRB(
                      50 * widthRatio,
                      0,
                      50 * widthRatio,
                      0,
                    ),
                    decoration: mainContainerBGBoxDecoration,
                    child: buttonList,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
