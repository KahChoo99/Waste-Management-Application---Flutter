import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/icon_and_title.dart';

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
    double demoWidth = 411.42857142857144;

    double screenHeight = MediaQuery.of(context).size.height;

    Map<String, String> binData= widget.binData;

    print(widget.binData);
    List<String> binKeys = widget.binData.keys.toList();

    Column cardList = Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          width: screenWidth,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                offset: Offset(5, 5), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Post Complaint",
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
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(binKey,
                            style: TextStyle(color: Color(0xFF65BEFF), fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(binData[binKey],
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text("Message:",
                      style: TextStyle(color: Color(0xFF65BEFF), fontWeight: FontWeight.bold, fontSize: 18)),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextField(
                  maxLines: 8,
                  controller: _messageEditingController,
                  decoration: InputDecoration(
                    hintText: "Description",
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
                  child: Text('Submit',
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
              Positioned.fill(
                  child: CustomPaint(
                    painter: CurvePainter(),
                  )
              ),
              IconButton(
                padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 40,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      IconAndTitle(screenWidth: screenWidth, demoWidth: demoWidth,),
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
