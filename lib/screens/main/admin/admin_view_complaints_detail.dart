import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/widgets/alert_dialog.dart';
import 'package:waste_management/widgets/arrow_back_pop.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/custom_decoration.dart';
import 'package:waste_management/widgets/icon_and_title.dart';

class AdminViewComplaintsDetail extends StatefulWidget {
  final Map<String, String> binComplaintData;

  const AdminViewComplaintsDetail({this.binComplaintData});

  @override
  _AdminViewComplaintsDetail createState() => _AdminViewComplaintsDetail();
}

class _AdminViewComplaintsDetail extends State<AdminViewComplaintsDetail> {
  TextEditingController _commentEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    Map<String, String> binComplaintData = widget.binComplaintData;

    String complaintID = binComplaintData[sComplaintID];
    String complaintMessage =
        "ddaeghulkytsadhuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuauisdhiadbasuvduhasvduashdbasbdjasbdsajbdjasdsadhuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuauisdhiadbasuvduhasvduashdbasbdjasbdsajbdjasd";

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
                child: TextField(
                  maxLines: 8,
                  maxLength: 225,
                  maxLengthEnforced: true,
                  controller: _commentEditingController,
                  decoration: InputDecoration(
                    hintText: sDescription,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.amber,
                        style: BorderStyle.solid,
                      ),
                    ),
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
                  minWidth: 220,
                  height: 50,
                  onPressed: () => showUpdateSuccess(context),
                  color: buttonBlue,
                  child: Text(sUpdate,
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
                        Text(sUpdateStatus,
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
              ),
            ),
            ArrowBackPop(),
          ],
        )
    );
  }
}
