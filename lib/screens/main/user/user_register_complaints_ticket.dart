import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/widgets/arrow_back_pop.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/custom_decoration.dart';
import 'package:waste_management/widgets/icon_and_title.dart';
import 'package:waste_management/widgets/alert_dialog.dart';

class UserRegisterComplaintsTicket extends StatefulWidget {
  final Map<String, String> binData;

  const UserRegisterComplaintsTicket({this.binData});
  @override
  _UserRegisterComplaintsTicket createState() => _UserRegisterComplaintsTicket();
}

class _UserRegisterComplaintsTicket extends State<UserRegisterComplaintsTicket> {
  TextEditingController _messageEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    Map<String, String> binData= widget.binData;

    List<String> binKeys = binData.keys.toList();

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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
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
                            style: TextStyle(color: wordAndIconBlue, fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(binData[binKey],
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
                      style: TextStyle(color: wordAndIconBlue, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextField(
                  maxLines: 8,
                  maxLength: 225,
                  maxLengthEnforced: true,
                  controller: _messageEditingController,
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
                  onPressed: () => showConfirmSubmit(context, binData, _messageEditingController),
                  color: buttonBlue,
                  child: Text(sContinue,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  textColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );

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
            ],
          ),
        ),
      ),
    );
  }
}
