import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/widgets/arrow_back_pop.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/custom_decoration.dart';
import 'package:waste_management/widgets/icon_and_title.dart';

class UserMyComplaintsStatus extends StatefulWidget {
  final Map<String, String> binComplaintData;

  const UserMyComplaintsStatus({this.binComplaintData});

  @override
  _UserMyComplaintsStatus createState() => _UserMyComplaintsStatus();
}

class _UserMyComplaintsStatus extends State<UserMyComplaintsStatus> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    Map<String, String> binComplaintData = widget.binComplaintData;

    String complaintID = binComplaintData[sComplaintID];
    String complaintMessage = "ddaeghulkytsadhuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuauisdhiadbasuvduhasvduashdbasbdjasbdsajbdjasdsadhuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuauisdhiadbasuvduhasvduashdbasbdjasbdsajbdjasd";
    String commentMessage = "ddaeghulkytsadhuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuauisdhiadbasuvduhasvduashdbasbdjasbdsajbdjasdsadhuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuauisdhiadbasuvduhasvduashdbasbdjasbdsajbdjasd";

    List<String> binKeys = binComplaintData.keys.toList();

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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(sPostComplaint,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ),
              SizedBox(
                height: 10,
              ),
              for (String binKey in binKeys)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text(binKey,
                            style: TextStyle(
                                color: wordAndIconBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text(binComplaintData[binKey],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                    )
                  ],
                ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(sMessage,
                      style: TextStyle(
                          color: wordAndIconBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(complaintMessage,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  )),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(sComment,
                      style: TextStyle(
                          color: wordAndIconBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(commentMessage,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
                decoration: mainButtonBoxDecoration,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  minWidth: 220,
                  height: 50,
                  // onPressed: () => showConfirmSubmit(context, binData, _messageEditingController),
                  onPressed: () {},
                  color: buttonBlue,
                  child: Text(sPending,
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

    return Scaffold(
      body: Stack(
        children: [
          BackgroundPainter(),
          ArrowBackPop(),
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconAndTitle(screenWidth: screenWidth),
                      Container(
                        width: screenWidth,
                        child: cardList,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
