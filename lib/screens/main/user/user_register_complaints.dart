import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/screens/main/user/user_register_complaints_ticket.dart';
import 'package:waste_management/widgets/arrow_back_pop.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/icon_and_title.dart';

class UserRegisterComplaints extends StatefulWidget {
  @override
  _UserRegisterComplaints createState() => _UserRegisterComplaints();
}

class _UserRegisterComplaints extends State<UserRegisterComplaints> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double demoWidth = 411.42857142857144;

    Map<String, String> binData= {
      "Bin ID:": "12345",
      "Area:": "Tanjong Karang",
      "Locality:": "None",
      "Landmark:": "Tak tahu",
      "City:": "Selangor"
    };

    List<String> binKeys = binData.keys.toList();

    Column cardList = Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (String binKey in binKeys)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Text(binKey,
                          style: TextStyle(color: Color(0xFF65BEFF), fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      child: Text(binData[binKey],
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                  )
                ],
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserRegisterComplaintsTicket(binData: binData,)),
                  );
                },
                color: Color(0xFF8AFF88),
                child: Text('Ticket',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                // textColor: Colors.black,
              ),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      body: Container(
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
                IconAndTitle(screenWidth: screenWidth, demoWidth: demoWidth,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text("Register Complaints",
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
    );
  }
}
