import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/widgets/arrow_back_pop.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/custom_decoration.dart';
import 'package:waste_management/widgets/icon_and_title.dart';

class AdminViewUsersDetails extends StatefulWidget {
  @override
  _AdminViewUsersDetails createState() => _AdminViewUsersDetails();
}

class _AdminViewUsersDetails extends State<AdminViewUsersDetails> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    Map<String, String> userData= {
      sUserID: "001",
      sName: "Apa saja la",
      sEmail: "entahla@gmail.com",
      sAddress: "B76, Taman Seri Jaya, 45500 Tanjong Karang, SelangB76, Taman Seri Jaya, 45500 Tanjong Karang, SelangB76, Taman Seri Jaya, 45500 Tanjong Karang, Seland",
    };

    List<String> userDataKeys = userData.keys.toList();

    Column cardList = Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
          decoration: mainContainerBGBoxDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.account_circle_sharp,
                  color: wordAndIconBlue,
                  size: 80,
                ),
              ),
              for (String userDataKey in userDataKeys)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                        child: Text(userDataKey,
                            style: TextStyle(color: wordAndIconBlue, fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        child: Text(userData[userDataKey],
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                    )
                  ],
                ),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Stack(
            children: [
              BackgroundPainter(),
              ArrowBackPop(),
              Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconAndTitle(screenWidth: screenWidth),
                      Text(sViewComplaints,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                      Container(
                        width: screenWidth,
                        child: cardList,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
