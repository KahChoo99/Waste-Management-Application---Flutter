import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/constants/values.dart';
import 'package:waste_management/data/data.dart';
import 'package:waste_management/screens/main/admin/admin_main_page.dart';
import 'package:waste_management/widgets/alert_dialog.dart';
import 'package:waste_management/widgets/arrow_back_pop.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/custom_decoration.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLogin createState() => _AdminLogin();
}

class _AdminLogin extends State<AdminLogin> {
  @override
  void initState() {
    super.initState();
  }

  Data d = Data.getInstance();

  TextEditingController _usernameEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double widthRatio = screenWidth / dDemoWidth;
    double heightRatio = screenHeight / dDemoHeight;

    void _togglePasswordView() {
      setState(() {
        _obscureText = !_obscureText;
      });
    }

    Column loginPart = Column(
      children: [
        SizedBox(
          height: 30 * heightRatio,
        ),
        Text(
          sAdminLogin,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24 * widthRatio,
          ),
        ),
        SizedBox(
          height: 10 * heightRatio,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
            30 * widthRatio,
            10 * heightRatio,
            30 * widthRatio,
            10 * heightRatio,
          ),
          child: TextField(
            controller: _usernameEditingController,
            decoration: InputDecoration(
              labelText: sUsername,
            ),
            style: TextStyle(
              fontSize: (defaultTextFieldFontSize + 2) * widthRatio,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
            30 * widthRatio,
            10 * heightRatio,
            30 * widthRatio,
            10 * heightRatio,
          ),
          child: TextField(
            controller: _passwordEditingController,
            decoration: InputDecoration(
              labelText: sPassword,
              suffix: InkWell(
                onTap: _togglePasswordView,
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
            obscureText: _obscureText,
            style: TextStyle(
              fontSize: (defaultTextFieldFontSize + 2) * widthRatio,
            ),
          ),
        ),
        SizedBox(
          height: 20 * heightRatio,
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
              if (_usernameEditingController.text.isEmpty ||
                  _passwordEditingController.text.isEmpty)
                showUsernameOrPasswordCannotBeEmpty(context);
              else {
                String username = _usernameEditingController.text;
                String password = _passwordEditingController.text;
                if (username != sAdmin)
                  showWrongAdminUsername(context);
                else {
                  if (d.checkAdminCredential(password)) {
                    d.login(sAdmin);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => AdminMainPage(),
                      ),
                      (route) => false,
                    );
                  } else
                    showWrongPassword(context);
                }
              }
            },
            color: buttonGreen,
            child: Text(
              sLogin,
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

    return StatefulBuilder(builder: (context, setState) {
      _usernameEditingController.addListener(() => setState(() {}));
      _passwordEditingController.addListener(() => setState(() {}));

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
                      height: 80 * heightRatio,
                    ),
                    Image.asset(
                      "assets/icon/apps_icon.png",
                      height: 200 * heightRatio,
                    ),
                    Text(
                      sAppTitle,
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
                      child: loginPart,
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
    });
  }
}
