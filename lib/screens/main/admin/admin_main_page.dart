import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/constants/values.dart';
import 'package:waste_management/data/data.dart';
import 'package:waste_management/screens/login_register/login_register.dart';
import 'package:waste_management/screens/main/admin/admin_update_bins.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/custom_decoration.dart';
import 'package:waste_management/widgets/icon_and_title.dart';
import 'package:waste_management/screens/main/admin/admin_create_bin.dart';
import 'package:waste_management/screens/main/admin/admin_view_complaints.dart';
import 'package:waste_management/screens/main/admin/admin_view_users_details.dart';

class AdminMainPage extends StatelessWidget {
  Data d = Data.getInstance();

  List<IconData> iconList = [
    Icons.app_registration,
    Icons.edit_sharp,
    Icons.preview_sharp,
    Icons.account_circle_sharp
  ];
  List<String> buttonString = [
    sCreateBin,
    sUpdateBins,
    sViewComplaints,
    sViewUserDetails
  ];
  var classList = [
    AdminCreateBin(),
    AdminUpdateBins(),
    AdminViewComplaints(),
    AdminViewUsersDetails()
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double widthRatio = screenWidth / dDemoWidth;
    double heightRatio = screenHeight / dDemoHeight;

    Column buttonList = Column(
      children: [
        for (var i = 0; i < iconList.length; i++)
          Container(
            margin: EdgeInsets.fromLTRB(
              40 * widthRatio,
              30 * heightRatio,
              40 * widthRatio,
              0,
            ),
            decoration: mainButtonBoxDecoration,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0 * heightRatio),
              ),
              minWidth: 220 * widthRatio,
              height: 80 * heightRatio,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => classList[i],
                  ),
                );
              },
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Icon(
                      iconList[i],
                      color: wordAndIconBlue,
                      size: 40 * heightRatio,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Text(
                      buttonString[i],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26 * widthRatio,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        SizedBox(
          height: 50 * heightRatio,
        ),
      ],
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: [
          BackgroundPainter(),
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  IconAndTitle(
                    widthRatio: widthRatio,
                    heightRatio: heightRatio,
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
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: bottomNavigatorGradient,
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            tileMode: TileMode.clamp,
          ),
        ),
        child: BottomNavigationBar(
          onTap: (int index) {
            if (index == 1) {
              d.logout();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => LoginRegister(),
                ),
                (route) => false,
              );
            }
          },
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amberAccent,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 24 * heightRatio,
              ),
              title: Text(
                sHome,
                style: TextStyle(
                  fontSize: 14 * widthRatio,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.logout,
                size: 24 * heightRatio,
              ),
              title: Text(
                sLogOut,
                style: TextStyle(
                  fontSize: 14 * widthRatio,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
