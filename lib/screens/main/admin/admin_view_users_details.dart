import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/data/data.dart';
import 'package:waste_management/data/userProfile/userProfile.dart';
import 'package:waste_management/widgets/arrow_back_pop.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/custom_decoration.dart';
import 'package:waste_management/widgets/icon_and_title.dart';

class AdminViewUsersDetails extends StatefulWidget {
  @override
  _AdminViewUsersDetails createState() => _AdminViewUsersDetails();
}

class _AdminViewUsersDetails extends State<AdminViewUsersDetails> {
  Data d = Data.getInstance();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    Column cardList = Column(
      children: [
        for (UserProfile userProfile in d.allUserProfile)
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
            decoration: mainContainerBGBoxDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.account_circle_sharp,
                    color: wordAndIconBlue,
                    size: 80,
                  ),
                ),
                for (String userDataKey
                    in userProfile.getUseProfileData().keys.toList())
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                          child: Text(userDataKey,
                              style: TextStyle(
                                  color: wordAndIconBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: Text(
                              userProfile.getUseProfileData()[userDataKey],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),
        SizedBox(
          height: 30,
        ),
      ],
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: [
          BackgroundPainter(),
          (d.allUserProfile.length < 2)
              ? Container(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconAndTitle(screenWidth: screenWidth),
                              Text(
                                sViewUserDetails,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              Container(
                                width: screenWidth,
                                child: cardList,
                              ),
                            ],
                          ),
                        ],
                      ),
                      ArrowBackPop(),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconAndTitle(screenWidth: screenWidth),
                                Text(
                                  sViewUserDetails,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                Container(
                                  width: screenWidth,
                                  child: cardList,
                                ),
                              ],
                            ),
                          ],
                        ),
                        ArrowBackPop(),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
