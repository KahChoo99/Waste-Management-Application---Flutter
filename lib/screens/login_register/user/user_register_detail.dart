import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
import 'package:waste_management/widgets/text_input_formatter.dart';

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

    double widthRatio = screenWidth / dDemoWidth;
    double heightRatio = screenHeight / dDemoHeight;

    Column registerPart = Column(
      children: [
        SizedBox(
          height: 30 * heightRatio,
        ),
        Text(
          sUserDetail,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24 * widthRatio,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
            30 * widthRatio,
            0,
            30 * widthRatio,
            10 * heightRatio,
          ),
          child: TextField(
            controller: _nameEditingController,
            decoration: InputDecoration(
              labelText: sName,
            ),
            style: TextStyle(
              fontSize: (defaultTextFieldFontSize + 2) * widthRatio,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
            30 * widthRatio,
            0,
            30 * widthRatio,
            10 * heightRatio,
          ),
          child: TextField(
            controller: _emailEditingController,
            decoration: InputDecoration(
              labelText: sEmail,
            ),
            style: TextStyle(
              fontSize: (defaultTextFieldFontSize + 2) * widthRatio,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
            30 * widthRatio,
            0,
            30 * widthRatio,
            10 * heightRatio,
          ),
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            maxLength: 150,
            maxLengthEnforced: true,
            inputFormatters: [
              ModifiedLengthLimitingTextInputFormatter(150)
            ],
            controller: _addressEditingController,
            decoration: InputDecoration(
              labelText: sAddress,
            ),
            style: TextStyle(
              fontSize: (defaultTextFieldFontSize + 2) * widthRatio,
            ),
          ),
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
            minWidth: 150 * widthRatio,
            height: 50 * heightRatio,
            onPressed: () {
              if (_nameEditingController.text.isEmpty ||
                  _emailEditingController.text.isEmpty ||
                  _addressEditingController.text.isEmpty)
                showNameOrEmailOrAddressCannotBeEmpty(context, widthRatio, heightRatio);
              else {
                String name = _nameEditingController.text;
                String email = _emailEditingController.text;
                String address = _addressEditingController.text;
                String userID = d.getNewID(BoxType.user);

                if (!email.contains("@") || !email.contains(".com"))
                  showPleaseUseValidEmail(context, widthRatio, heightRatio);
                else {
                  print("User ID = " + userID);
                  print("Name = " + name);
                  print("Email = " + email);
                  print("Address = " + address);
                  UserProfile userProfile =
                      UserProfile(widget.user, userID, name, email, address);
                  d.addNewUser(userProfile);
                  showRegisterUserSuccess(context, widthRatio, heightRatio);
                }
              }
            },
            color: buttonGreen,
            child: Text(
              sSignUp,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24 * widthRatio,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20 * heightRatio,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50 * heightRatio,
                  ),
                  Image.asset(
                    "assets/icon/apps_icon.png",
                    height: 200 * heightRatio,
                  ),
                  Text(
                    sAppTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24 * widthRatio,
                    ),
                  ),
                  SizedBox(
                    height: 16 * heightRatio,
                  ),
                  Container(
                    width: screenWidth,
                    margin: EdgeInsets.fromLTRB(
                      50 * widthRatio,
                      0,
                      50 * widthRatio,
                      0,
                    ),
                    decoration: mainContainerBGBoxDecoration,
                    child: registerPart,
                  ),
                  SizedBox(
                    height: 30 * heightRatio,
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
    );
  }
}
