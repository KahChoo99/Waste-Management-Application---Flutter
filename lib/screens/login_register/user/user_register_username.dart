import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/data/data.dart';
import 'package:waste_management/data/user/user.dart';
import 'package:waste_management/screens/login_register/user/user_register_detail.dart';
import 'package:waste_management/widgets/alert_dialog.dart';
import 'package:waste_management/widgets/arrow_back_pop.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/custom_decoration.dart';

class UserRegisterUsername extends StatefulWidget {
  @override
  _UserRegisterUsername createState() => _UserRegisterUsername();
}

class _UserRegisterUsername extends State<UserRegisterUsername> {
  @override
  void initState() {
    super.initState();
  }

  Data d = Data.getInstance();

  TextEditingController _usernameEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();
  TextEditingController _confirmPasswordEditingController =
      TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    void _togglePasswordView() {
      setState(() {
        _obscureText = !_obscureText;
      });
    }

    Column registerPart = Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Text(sUserRegister,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: TextField(
            controller: _usernameEditingController,
            decoration: InputDecoration(
              labelText: sUsername,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
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
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: TextField(
            controller: _confirmPasswordEditingController,
            decoration: InputDecoration(
              labelText: sConfirmPassword,
              suffix: InkWell(
                onTap: _togglePasswordView,
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
            obscureText: _obscureText,
          ),
        ),
        SizedBox(
          height: 20,
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
              if (_usernameEditingController.text.isEmpty ||
                  _passwordEditingController.text.isEmpty ||
                  _confirmPasswordEditingController.text.isEmpty)
                showUsernameOrPasswordCannotBeEmpty(context);
              else {
                String username = _usernameEditingController.text;
                String password = _passwordEditingController.text;
                String confirmPassword = _confirmPasswordEditingController.text;
                if (password == confirmPassword) {
                  if (d.checkUniqueUsername(username)) {
                    User user = User(username, password);
                    print("Username = " + username);
                    print("Password = " + password);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserRegisterDetail(
                          user: user,
                        ),
                      ),
                    );
                  } else
                    showUsernameHasBeenTaken(context);
                } else
                  showConfirmPasswordMustBeTheSameAsPassword(context);
              }
            },
            color: buttonBlue,
            child: Text(sContinue,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            // textColor: Colors.black,
          ),
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );

    return StatefulBuilder(builder: (context, setState) {
      _usernameEditingController.addListener(() => setState(() {}));
      _passwordEditingController.addListener(() => setState(() {}));
      _confirmPasswordEditingController.addListener(() => setState(() {}));

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
                ArrowBackPop(screenWidth: screenWidth, screenHeight: screenHeight),
              ],
            ),
          ),
        ),
      );
    });
  }
}
