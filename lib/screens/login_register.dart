import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/screens/user/user_login.dart';
import 'package:waste_management/screens/user/user_register.dart';
import 'package:waste_management/ui/curve_painter.dart';

class LoginRegister extends StatefulWidget {
  @override
  _LoginRegister createState() => _LoginRegister();
}

class _LoginRegister extends State<LoginRegister> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    Column buttonList = Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                offset: Offset(5, 5), // changes position of shadow
              ),
            ],
          ),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minWidth: 220,
            height: 50,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserLogin()),
              );
            },
            color: Color(0xFFA1D8FF),
            child: Text('User Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            textColor: Colors.black,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                offset: Offset(5, 5), // changes position of shadow
              ),
            ],
          ),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minWidth: 220,
            height: 50,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserRegister()),
              );
            },
            color: Color(0xFFA1D8FF),
            child: Text('User Register',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            textColor: Colors.black,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                offset: Offset(5, 5), // changes position of shadow
              ),
            ],
          ),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            minWidth: 220,
            height: 50,
            onPressed: () {},
            color: Color(0xFFA1D8FF),
            child: Text('Admin Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            // textColor: Colors.black,
          ),
        ),
        SizedBox(
          height: 60,
        ),
      ],
    );
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: CurvePainter(),)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/icon/recycle_icon.png", height: 200,),
              Text("Solid Waste Management", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              SizedBox(
                height: 16,
              ),
              Container(
                width: screenWidth,
                margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      offset: Offset(5, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: buttonList,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
