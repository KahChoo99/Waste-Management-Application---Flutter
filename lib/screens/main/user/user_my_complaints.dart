import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/screens/main/user/user_my_complaints_status.dart';
import 'package:waste_management/widgets/arrow_back_pop.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/custom_decoration.dart';
import 'package:waste_management/widgets/icon_and_title.dart';

class UserMyComplaints extends StatefulWidget {
  @override
  _UserMyComplaints createState() => _UserMyComplaints();
}

class _UserMyComplaints extends State<UserMyComplaints> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    Map<String, String> binComplaintData= {
      sComplaintID: "202102030001",
      sBinID: "B0001",
      sFTState: "Selangor",
      sDistrict: "Kuala Selangor",
      sSubDistrict: "Tanjong Karang",
      sArea: "Taman Seri Jaya",
      sCleaningPeriod: "2 times per week"
    };

    List<String> binKeys = binComplaintData.keys.toList();

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
              for (String binKey in binKeys)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
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
                        child: Text(binComplaintData[binKey],
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                    )
                  ],
                ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                child: Text(sStatus,
                    style: TextStyle(color: wordAndIconBlue, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserMyComplaintsStatus(binComplaintData: binComplaintData,)),
                  );
                },
                color: buttonBlue,
                child: Text(sPending,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                // textColor: Colors.black,
              ),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconAndTitle(screenWidth: screenWidth),
                    Text(sMyComplaints,
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
