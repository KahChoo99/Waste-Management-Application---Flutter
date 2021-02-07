import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/constants/values.dart';
import 'package:waste_management/data/bin/bin.dart';
import 'package:waste_management/data/data.dart';
import 'package:waste_management/screens/main/user/user_register_complaints_ticket.dart';
import 'package:waste_management/widgets/arrow_back_pop.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/custom_decoration.dart';
import 'package:waste_management/widgets/icon_and_title.dart';

class UserRegisterComplaints extends StatefulWidget {
  @override
  _UserRegisterComplaints createState() => _UserRegisterComplaints();
}

class _UserRegisterComplaints extends State<UserRegisterComplaints> {
  Data d = Data.getInstance();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double widthRatio = screenWidth / dDemoWidth;
    double heightRatio = screenHeight / dDemoHeight;

    Column cardList = Column(
      children: [
        for (Bin bin in d.binsAvailable)
          Container(
            padding: EdgeInsets.fromLTRB(
              10 * widthRatio,
              10 * heightRatio,
              10 * widthRatio,
              10 * heightRatio,
            ),
            margin: EdgeInsets.fromLTRB(
              30 * widthRatio,
              20 * heightRatio,
              30 * widthRatio,
              0,
            ),
            decoration: mainContainerBGBoxDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (String binKey in bin.getBinData().keys.toList())
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            2 * heightRatio,
                            0,
                            0,
                          ),
                          child: Text(
                            binKey,
                            style: TextStyle(
                              color: wordAndIconBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16 * widthRatio,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10 * widthRatio,
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          child: Text(
                            bin.getBinData()[binKey],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18 * widthRatio,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0 * heightRatio),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserRegisterComplaintsTicket(
                          bin: bin,
                        ),
                      ),
                    );
                  },
                  color: buttonBlue,
                  child: Text(
                    sAddComplaint,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18 * widthRatio,
                    ),
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

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: [
          BackgroundPainter(),
          (d.binsAvailable.length < 2)
              ? Container(
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
                              IconAndTitle(widthRatio: widthRatio, heightRatio: heightRatio,),
                              Text(
                                sRegisterComplaints,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24 * widthRatio,
                                ),
                              ),
                              (d.binsAvailable.length != 0)
                                  ? Container(
                                      width: screenWidth,
                                      child: cardList,
                                    )
                                  : Container(
                                      width: screenWidth,
                                      margin: EdgeInsets.fromLTRB(
                                        40 * widthRatio,
                                        20 * heightRatio,
                                        40 * widthRatio,
                                        40 * heightRatio,
                                      ),
                                      padding: EdgeInsets.fromLTRB(
                                        10 * widthRatio,
                                        20 * heightRatio,
                                        10 * widthRatio,
                                        20 * heightRatio,
                                      ),
                                      decoration: mainContainerBGBoxDecoration,
                                      alignment: Alignment.center,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Icon(
                                              Icons.info,
                                              size: 45 * heightRatio,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: Text(
                                              sNoBinAvailableAtTheMoment,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24 * widthRatio,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
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
                )
              : SingleChildScrollView(
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
                                IconAndTitle(widthRatio: widthRatio, heightRatio: heightRatio,),
                                Text(
                                  sRegisterComplaints,
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
  }
}
