import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/constants/values.dart';
import 'package:waste_management/data/data.dart';
import 'package:waste_management/data/user/user.dart';
import 'package:waste_management/data/userProfile/userProfile.dart';
import 'package:waste_management/widgets/alert_dialog.dart';
import 'package:waste_management/widgets/arrow_back_pop.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/custom_decoration.dart';
import 'package:waste_management/widgets/icon_and_title.dart';
import 'package:waste_management/widgets/text_input_formatter.dart';

class UserEditMyProfile extends StatefulWidget {
  final UserProfile userProfile;

  const UserEditMyProfile({this.userProfile});

  @override
  _UserEditMyProfile createState() => _UserEditMyProfile();
}

class _UserEditMyProfile extends State<UserEditMyProfile> {
  @override
  void initState() {
    super.initState();
  }

  Data d = Data.getInstance();

  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _addressEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double widthRatio = screenWidth / dDemoWidth;
    double heightRatio = screenHeight / dDemoHeight;

    User user = widget.userProfile.user;
    Map<String, String> userData = widget.userProfile.getUseProfileData();
    String userID = userData.remove(sUserID);

    if (_nameEditingController.text.isEmpty)
      _nameEditingController.text = widget.userProfile.name;

    if (_emailEditingController.text.isEmpty)
      _emailEditingController.text = widget.userProfile.email;

    if (_addressEditingController.text.isEmpty)
      _addressEditingController.text = widget.userProfile.address;

    var _editingController = [
      _nameEditingController,
      _emailEditingController,
      _addressEditingController
    ];

    List<String> userDataKeys = userData.keys.toList();

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
                height: 10 * heightRatio,
              ),
              for (var i = 0; i < userDataKeys.length; i++)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                          10 * widthRatio,
                          10 * heightRatio,
                          0,
                          10 * heightRatio,
                        ),
                        child: Text(
                          userDataKeys[i],
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
                            0, 0, 10 * widthRatio, 10 * heightRatio),
                        child: i != userDataKeys.length - 1
                            ? TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                controller: _editingController[i],
                                style: TextStyle(
                                  fontSize: (defaultTextFieldFontSize + 2) *
                                      widthRatio,
                                ),
                              )
                            : TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                maxLength: 150,
                                maxLengthEnforced: true,
                                inputFormatters: [
                                  ModifiedLengthLimitingTextInputFormatter(150)
                                ],
                                controller: _editingController[i],
                                style: TextStyle(
                                  fontSize: (defaultTextFieldFontSize + 2) *
                                      widthRatio,
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
                  onPressed: () {
                    String name = _nameEditingController.text;
                    print(name);
                    String email = _emailEditingController.text;
                    print(email);
                    String address = _addressEditingController.text;
                    print(address);
                    if (name == null || email == null || address == null)
                      showNameOrEmailOrAddressCannotBeEmpty(
                          context, widthRatio, heightRatio);
                    else {
                      if (!email.contains("@") || !email.contains(".com"))
                        showPleaseUseValidEmail(
                            context, widthRatio, heightRatio);
                      else {
                        UserProfile userProfile =
                            UserProfile(user, userID, name, email, address);
                        d.editProfile(userProfile);
                        showSaveSuccess(context, widthRatio, heightRatio);
                      }
                    }
                  },
                  color: buttonGreen,
                  child: Text(
                    sSave,
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

    return StatefulBuilder(builder: (context, setState) {
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
                            IconAndTitle(
                              widthRatio: widthRatio,
                              heightRatio: heightRatio,
                            ),
                            Text(
                              sEditProfile,
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
    });
  }
}
