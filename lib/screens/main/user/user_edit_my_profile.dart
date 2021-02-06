import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/data/data.dart';
import 'package:waste_management/data/user/user.dart';
import 'package:waste_management/data/userProfile/userProfile.dart';
import 'package:waste_management/widgets/alert_dialog.dart';
import 'package:waste_management/widgets/arrow_back_pop.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/custom_decoration.dart';
import 'package:waste_management/widgets/icon_and_title.dart';

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
                height: 10,
              ),
              for (var i = 0; i < userDataKeys.length; i++)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Text(
                          userDataKeys[i],
                          style: TextStyle(
                            color: wordAndIconBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: i != userDataKeys.length - 1
                            ? TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                controller: _editingController[i],
                              )
                            : TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                maxLength: 150,
                                maxLengthEnforced: true,
                                controller: _editingController[i],
                              ),
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
                  onPressed: () {
                    String name = _nameEditingController.text;
                    print(name);
                    String email = _emailEditingController.text;
                    print(email);
                    String address = _addressEditingController.text;
                    print(address);
                    if (name == null || email == null || address == null)
                      showNameOrEmailOrAddressCannotBeEmpty(context);
                    else {
                      if (!email.contains("@") || !email.contains(".com"))
                        showPleaseUseValidEmail(context);
                      else {
                        UserProfile userProfile = UserProfile(user, userID, name, email, address);
                        d.editProfile(userProfile);
                        showSaveSuccess(context);
                      }
                    }
                  },
                  color: buttonGreen,
                  child: Text(sSave,
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

    return StatefulBuilder(builder: (context, setState){
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: screenHeight,
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
                        Text(sEditProfile,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24)),
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
      );
    });
  }
}
