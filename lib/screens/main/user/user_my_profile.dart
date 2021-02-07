import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/constants/values.dart';
import 'package:waste_management/data/data.dart';
import 'package:waste_management/data/userProfile/userProfile.dart';
import 'package:waste_management/screens/main/user/user_edit_my_profile.dart';
import 'package:waste_management/widgets/arrow_back_pop.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/custom_decoration.dart';
import 'package:waste_management/widgets/icon_and_title.dart';

class UserMyProfile extends StatefulWidget {
  @override
  _UserMyProfile createState() => _UserMyProfile();
}

class _UserMyProfile extends State<UserMyProfile> {
  Data d = Data.getInstance();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double widthRatio = screenWidth / dDemoWidth;
    double heightRatio = screenHeight / dDemoHeight;

    UserProfile userProfile = d.userProfile;
    Map<String, String> userData = userProfile.getUseProfileData();

    Column cardList = Column(
      children: [
        SizedBox(
          height: 20 * heightRatio,
        ),
        Container(
          width: screenWidth,
          padding: EdgeInsets.fromLTRB(
            10 * widthRatio,
            10 * heightRatio,
            10 * widthRatio,
            10 * heightRatio,
          ),
          margin: EdgeInsets.fromLTRB(
            30 * widthRatio,
            0,
            30 * widthRatio,
            0,
          ),
          decoration: mainContainerBGBoxDecoration,
          child: Column(
            children: [
              SizedBox(
                height: 10 * heightRatio,
              ),
              Icon(
                Icons.account_circle_sharp,
                color: wordAndIconBlue,
                size: 100 * heightRatio,
              ),
              SizedBox(
                height: 20 * heightRatio,
              ),
              for (String userDataKey in userData.keys.toList())
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                          10 * widthRatio,
                          0,
                          0,
                          10 * heightRatio,
                        ),
                        child: Text(
                          userDataKey,
                          style: TextStyle(
                            color: wordAndIconBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20 * widthRatio,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15 * widthRatio,
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                          0,
                          0,
                          10 * widthRatio,
                          10 * heightRatio,
                        ),
                        child: Text(
                          userData[userDataKey],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20 * widthRatio,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              SizedBox(
                height: 10 * heightRatio,
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
                  // onPressed: () => showConfirmSubmit(context, binData, _messageEditingController),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserEditMyProfile(
                          userProfile: userProfile,
                        ),
                      ),
                    );
                  },
                  color: buttonBlue,
                  child: Text(
                    sEditProfile,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24 * widthRatio,
                    ),
                  ),
                  textColor: Colors.black,
                ),
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
      body: Stack(
        children: [
          BackgroundPainter(),
          SingleChildScrollView(
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
                            sMyProfile,
                            textAlign: TextAlign.center,
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
