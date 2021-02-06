import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/data/data.dart';
import 'package:waste_management/data/user/user.dart';
import 'package:waste_management/data/userProfile/userProfile.dart';
import 'package:waste_management/widgets/alert_dialog.dart';
import 'package:waste_management/widgets/arrow_back_pop.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/custom_decoration.dart';

class UserRegisterDetail extends StatefulWidget {
  final User user;

  const UserRegisterDetail({this.user});

  @override
  _UserRegisterDetail createState() => _UserRegisterDetail();
}

class _UserRegisterDetail extends State<UserRegisterDetail> {
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

    Column registerPart = Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Text(sUserDetail,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        Container(
          margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
          child: TextField(
            controller: _nameEditingController,
            decoration: InputDecoration(
              labelText: sName,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
          child: TextField(
            controller: _emailEditingController,
            decoration: InputDecoration(
              labelText: sEmail,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            maxLength: 150,
            maxLengthEnforced: true,
            controller: _addressEditingController,
            decoration: InputDecoration(
              labelText: sAddress,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
          decoration: mainButtonBoxDecoration,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minWidth: 150,
            height: 50,
            onPressed: () {
              if (_nameEditingController.text.isEmpty ||
                  _emailEditingController.text.isEmpty ||
                  _addressEditingController.text.isEmpty)
                showNameOrEmailOrAddressCannotBeEmpty(context);
              else {
                String name = _nameEditingController.text;
                String email = _emailEditingController.text;
                String address = _addressEditingController.text;
                String userID = d.getNewID(BoxType.user);

                if (!email.contains("@") || !email.contains(".com"))
                  showPleaseUseValidEmail(context);
                else {
                  print("User ID = " + userID);
                  print("Name = " + name);
                  print("Email = " + email);
                  print("Address = " + address);
                  UserProfile userProfile = UserProfile(widget.user, userID, name, email, address);
                  d.addNewUser(userProfile);
                  showRegisterUserSuccess(context);
                }
              }
            },
            color: buttonGreen,
            child: Text(sSignUp,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            // textColor: Colors.black,
          ),
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          alignment: Alignment.center,
          child: Stack(
            children: [
              BackgroundPainter(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/icon/apps_icon.png",
                    height: 200,
                  ),
                  Text(sAppTitle,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24)),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: screenWidth,
                    margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    decoration: mainContainerBGBoxDecoration,
                    child: registerPart,
                  ),
                ],
              ),
              ArrowBackPop(),
            ],
          ),
        ),
      ),
    );
  }
}
