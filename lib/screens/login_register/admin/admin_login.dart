import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waste_management/constants/strings.dart';
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

  bool _obscureText = true;

  TextEditingController _usernameEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    void _togglePasswordView() {
      setState(() {
        _obscureText = !_obscureText;
      });
    }

    Column loginPart = Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Text(sAdminLogin,
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
            onPressed: () {},
            color: Color(0xFFB969F8),
            child: Text(sLogin,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
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

      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            alignment: Alignment.center,
            child: Stack(
              children: [
                BackgroundPainter(),
                ArrowBackPop(),
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
                      child: loginPart,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
