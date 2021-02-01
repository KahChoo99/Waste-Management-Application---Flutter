import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:waste_management/ui/curve_painter.dart';

class UserMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double demoWidth = 411.42857142857144;

    Column buttonList = Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                offset: Offset(5, 5), // changes position of shadow
              ),
            ],
          ),
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
                    Icons.app_registration,
                    color: Color(0xFF65BEFF),
                    size: 40,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text('Register Complaints',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 26 * screenWidth / demoWidth)),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(50, 30, 50, 0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                offset: Offset(5, 5), // changes position of shadow
              ),
            ],
          ),
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
                  child: Text('My Complaints',
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
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                offset: Offset(5, 5), // changes position of shadow
              ),
            ],
          ),
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
                  child: Text('My Profile',
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
            Positioned.fill(
                child: CustomPaint(
              painter: CurvePainter(),
            )),
            Column(
              children: [
                Container(
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
                          child: Text(
                              "Solid Waste Management",
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
                                  fontSize: 30 * screenWidth / demoWidth
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
          onTap: (index) {},
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(color: Colors.white),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              title: Text(
                "Log Out",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
