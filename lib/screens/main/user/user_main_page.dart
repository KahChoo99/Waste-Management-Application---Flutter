import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/values.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/screens/main/user/user_register_complaints.dart';
import 'package:waste_management/widgets/custom_decoration.dart';
import 'package:waste_management/widgets/icon_and_title.dart';

class UserMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    Column buttonList = Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
          decoration: mainButtonBoxDecoration,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minWidth: 220,
            height: 80,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserRegisterComplaints()),
              );
            },
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Icon(
                    Icons.app_registration,
                    color: Color(0xFF65BEFF),
                    size: 40,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text(sRegisterComplaints,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 26 * screenWidth / dDemoWidth)),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(50, 30, 50, 0),
          decoration: mainButtonBoxDecoration,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minWidth: 220,
            height: 80,
            onPressed: () {},
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Icon(
                    Icons.preview_sharp,
                    color: Color(0xFF65BEFF),
                    size: 45,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text(sMyComplaints,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 26)),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(50, 30, 50, 10),
          decoration: mainButtonBoxDecoration,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minWidth: 220,
            height: 80,
            onPressed: () {},
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Icon(
                    Icons.account_circle_sharp,
                    color: Color(0xFF65BEFF),
                    size: 45,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text(sMyProfile,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 26)),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            BackgroundPainter(),
            Column(
              children: [
                IconAndTitle(screenWidth: screenWidth),
                Column(
                  children: <Widget>[
                    Container(
                      width: screenWidth,
                      child: buttonList,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF65BEFF), Color(0xFFB969F8)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            tileMode: TileMode.clamp,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amberAccent,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                sHome,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              title: Text(
                sLogOut,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
