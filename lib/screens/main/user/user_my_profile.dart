import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
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

    UserProfile userProfile = d.userProfile;
    Map<String, String> userData = userProfile.getUseProfileData();

    Column cardList = Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          width: screenWidth,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
          decoration: mainContainerBGBoxDecoration,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Icon(
                Icons.account_circle_sharp,
                color: wordAndIconBlue,
                size: 100,
              ),
              SizedBox(
                height: 20,
              ),
              for (String userDataKey in userData.keys.toList())
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                        child: Text(userDataKey,
                            style: TextStyle(
                                color: wordAndIconBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: Text(userData[userDataKey],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                    )
                  ],
                ),
              SizedBox(
                height: 10,
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
                  // onPressed: () => showConfirmSubmit(context, binData, _messageEditingController),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserEditMyProfile(userProfile: userProfile,)),
                    );
                  },
                  color: buttonBlue,
                  child: Text(sEditProfile,
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  textColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Stack(
            children: [
              BackgroundPainter(),
              Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconAndTitle(screenWidth: screenWidth),
                      Text(sMyProfile,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                      Container(
                        width: screenWidth,
                        child: cardList,
                      ),
                    ],
                  ),
                ],
              ),
              ArrowBackPop(screenWidth: screenWidth, screenHeight: screenHeight),
            ],
          ),
        ),
      ),
    );
  }
}
