import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/constants/values.dart';
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
    double screenHeight = MediaQuery.of(context).size.height;

    double widthRatio = screenWidth / dDemoWidth;
    double heightRatio = screenHeight / dDemoHeight;

    Column cardList = Column(
      children: [
        for (UserProfile userProfile in d.allUserProfile)
          Container(
            padding: EdgeInsets.fromLTRB(
              10 * widthRatio,
              10 * heightRatio,
              10 * widthRatio,
              10 * heightRatio,
            ),
            margin: EdgeInsets.fromLTRB(
              20 * widthRatio,
              20 * heightRatio,
              20 * widthRatio,
              0,
            ),
            decoration: mainContainerBGBoxDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.account_circle_sharp,
                    color: wordAndIconBlue,
                    size: 80 * heightRatio,
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
                          padding: EdgeInsets.fromLTRB(
                            0,
                            2 * heightRatio,
                            0,
                            0,
                          ),
                          child: Text(
                            userDataKey,
                            style: TextStyle(
                              color: wordAndIconBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16 * widthRatio,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10 * widthRatio,
                      ),
                      Expanded(
                        flex: 7,
                        child: Container(
                          child: Text(
                            userProfile.getUseProfileData()[userDataKey],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18 * widthRatio,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),
        SizedBox(
          height: 30 * heightRatio,
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
                            height: 50 * heightRatio,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconAndTitle(widthRatio: widthRatio, heightRatio: heightRatio,),
                              Text(
                                sViewUserDetails,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24 * widthRatio,
                                ),
                              ),
                              (d.allUserProfile.length != 0)
                                  ? Container(
                                      width: screenWidth,
                                      child: cardList,
                                    )
                                  : Container(
                                      width: screenWidth,
                                      margin: EdgeInsets.fromLTRB(
                                        40 * widthRatio,
                                        20 * heightRatio,
                                        40 * widthRatio,
                                        40 * heightRatio,
                                      ),
                                      padding: EdgeInsets.fromLTRB(
                                        10 * widthRatio,
                                        20 * heightRatio,
                                        10 * widthRatio,
                                        20 * heightRatio,
                                      ),
                                      decoration: mainContainerBGBoxDecoration,
                                      alignment: Alignment.center,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Icon(
                                              Icons.info,
                                              size: 45 * heightRatio,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: Text(
                                              sNoUserAvailableAtTheMoment,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24 * widthRatio,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                        ],
                      ),
                      ArrowBackPop(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                      ),
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
                              height: 50 * heightRatio,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconAndTitle(widthRatio: widthRatio, heightRatio: heightRatio,),
                                Text(
                                  sViewUserDetails,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24 * widthRatio,
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
                        ArrowBackPop(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
