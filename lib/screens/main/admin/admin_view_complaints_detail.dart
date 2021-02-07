import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/constants/values.dart';
import 'package:waste_management/data/complaint/complaint.dart';
import 'package:waste_management/data/data.dart';
import 'package:waste_management/widgets/alert_dialog.dart';
import 'package:waste_management/widgets/arrow_back_pop.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/custom_decoration.dart';
import 'package:waste_management/widgets/icon_and_title.dart';

class AdminViewComplaintsDetail extends StatefulWidget {
  final Complaint complaint;

  const AdminViewComplaintsDetail({this.complaint});

  @override
  _AdminViewComplaintsDetail createState() => _AdminViewComplaintsDetail();
}

class _AdminViewComplaintsDetail extends State<AdminViewComplaintsDetail> {
  Data d = Data.getInstance();

  TextEditingController _commentEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double widthRatio = screenWidth / dDemoWidth;
    double heightRatio = screenHeight / dDemoHeight;

    Map<String, String> binComplaintData =
        widget.complaint.getBinDataForAdmin();
    String status = binComplaintData.remove(sStatus);
    List<String> binKeys = binComplaintData.keys.toList();

    String complaintMessage = widget.complaint.complaintMessage;
    String commentMessage = widget.complaint.commentMessage;

    Column cardList = Column(
      children: [
        SizedBox(
          height: 20 * heightRatio,
        ),
        Container(
          width: screenWidth,
          padding: EdgeInsets.fromLTRB(
            10 * widthRatio,
            10 * heightRatio,
            10 * widthRatio,
            10 * heightRatio,
          ),
          margin: EdgeInsets.fromLTRB(
            30 * widthRatio,
            0,
            30 * widthRatio,
            0,
          ),
          decoration: mainContainerBGBoxDecoration,
          child: Column(
            children: [
              SizedBox(
                height: 10 * heightRatio,
              ),
              for (String binKey in binKeys)
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
                        margin: EdgeInsets.fromLTRB(
                          0,
                          0,
                          0,
                          10 * heightRatio,
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
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10 * heightRatio,),
                        child: Text(
                          binComplaintData[binKey],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18 * widthRatio,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    2 * heightRatio,
                    0,
                    0,
                  ),
                  margin: EdgeInsets.fromLTRB(
                    0,
                    0,
                    0,
                    10 * heightRatio,
                  ),
                  child: Text(
                    sMessage,
                    style: TextStyle(
                      color: wordAndIconBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16 * widthRatio,
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(
                    0,
                    0,
                    0,
                    10 * heightRatio,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      complaintMessage,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18 * widthRatio,
                      ),
                    ),
                  )),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    2 * heightRatio,
                    0,
                    0,
                  ),
                  margin: EdgeInsets.fromLTRB(
                    0,
                    0,
                    0,
                    10 * heightRatio,
                  ),
                  child: Text(
                    sComment,
                    style: TextStyle(
                      color: wordAndIconBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16 * widthRatio,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                  0,
                  0,
                  0,
                  10 * heightRatio,
                ),
                child: status == sPending
                    ? TextField(
                        maxLines: 8,
                        maxLength: 225,
                        maxLengthEnforced: true,
                        controller: _commentEditingController,
                        decoration: InputDecoration(
                          hintText: sDescription,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(10.0 * heightRatio),
                            borderSide: BorderSide(
                              color: Colors.amber,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: (defaultTextFieldFontSize + 2) * widthRatio,
                        ),
                      )
                    : Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            2 * heightRatio,
                            0,
                            0,
                          ),
                          margin: EdgeInsets.fromLTRB(
                            0,
                            0,
                            0,
                            10 * heightRatio,
                          ),
                          child: Text(
                            commentMessage,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18 * widthRatio,
                            ),
                          ),
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
                  minWidth: 220 * widthRatio,
                  height: 50 * heightRatio,
                  onPressed: status == sPending
                      ? () {
                          String commentMessage =
                              _commentEditingController.text;
                          if (commentMessage == null || commentMessage == "")
                            showPleaseWriteSomeMessage(context, widthRatio, heightRatio);
                          else {
                            if (commentMessage == "-" ||
                                commentMessage == "None" ||
                                commentMessage == "none")
                              showPleaseWriteSomeMessage(context, widthRatio, heightRatio);
                            else {
                              d.updateComplaintStatus(
                                  widget.complaint, commentMessage);
                              showUpdateSuccess(context, widthRatio, heightRatio);
                            }
                          }
                        }
                      : () {},
                  color: status == sPending ? buttonBlue : buttonGreen,
                  child: Text(
                    status == sPending ? sUpdate : sUpdated,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24 * widthRatio,
                    ),
                  ),
                  textColor: Colors.black,
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
      body: Stack(
        children: [
          BackgroundPainter(),
          SingleChildScrollView(
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
                            sUpdateStatus,
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
