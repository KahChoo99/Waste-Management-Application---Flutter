import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/data/bin/bin.dart';
import 'package:waste_management/data/data.dart';
import 'package:waste_management/widgets/arrow_back_pop.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/custom_decoration.dart';
import 'package:waste_management/widgets/icon_and_title.dart';
import 'package:waste_management/widgets/alert_dialog.dart';

class AdminUpdateBinsDetail extends StatefulWidget {
  final Map<String, String> binData;

  const AdminUpdateBinsDetail({this.binData});
  @override
  _AdminUpdateBinsDetail createState() => _AdminUpdateBinsDetail();
}

class _AdminUpdateBinsDetail extends State<AdminUpdateBinsDetail> {
  @override
  void initState() {
    super.initState();
  }
  Data d = Data.getInstance();

  String fTState;
  String district;
  String subDistrict;

  TextEditingController _areaEditingController = TextEditingController();
  TextEditingController _cleaningPeriodEditingController = TextEditingController();

  List<String> fTStateList = list_sFTState_sDistrict_SubDistrict.keys.toList();
  List<String> districtList = [];
  List<String> subDistrictList = [];

  String fTStateHint = sSelectFTState;
  String districtHint = "";
  String subDistrictHint = "";

  List<String> columnType = [sFTState, sDistrict, sSubDistrict];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String binID = widget.binData[sBinID];

    if (fTState != null) {
      if (district == null) {
        districtList =
            list_sFTState_sDistrict_SubDistrict[fTState].keys.toList();
      } else {
        subDistrictList =
        list_sFTState_sDistrict_SubDistrict[fTState][district];
      }
    }else{
      fTState = widget.binData[sFTState];
      district = widget.binData[sDistrict];
      districtList = list_sFTState_sDistrict_SubDistrict[fTState].keys.toList();
      subDistrict = widget.binData[sSubDistrict];
      subDistrictList = list_sFTState_sDistrict_SubDistrict[fTState][district];
      _areaEditingController.text = widget.binData[sArea];
      _cleaningPeriodEditingController.text = widget.binData[sCleaningPeriod][0];
    }

    var allValues = [fTState, district, subDistrict];
    var allDropDownList = [fTStateList, districtList, subDistrictList];
    var hintTextList = [fTStateHint, districtHint, subDistrictHint];

    Column cardList = Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: screenWidth,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
          decoration: mainContainerBGBoxDecoration,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              for (var i = 0; i < allDropDownList.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(columnType[i],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    Container(
                        width: screenWidth,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all()
                        ),
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                              hint: Text(hintTextList[i]),
                              value: allValues[i],
                              icon: Icon(Icons.arrow_drop_down),
                              items: allDropDownList[i]
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,
                                          style: TextStyle(fontSize: 16)),
                                    );
                                  }).toList(),
                              onChanged: (String value) {
                                setState(() {
                                  switch (i) {
                                    case 0:
                                      {
                                        fTState = value;
                                        district = null;
                                        districtHint = sSelectDistrict;
                                        subDistrict = null;
                                        subDistrictHint = "";
                                        _areaEditingController.text = "";
                                      }
                                      break;
                                    case 1:
                                      {
                                        district = value;
                                        subDistrict = null;
                                        subDistrictHint = sSelectSubDistrict;
                                        _areaEditingController.text = "";
                                      }
                                      break;
                                    case 2:
                                      {
                                        subDistrict = value;
                                        _areaEditingController.text = "";
                                      }
                                      break;
                                  }
                                });
                              },
                            ),
                          ),
                        )),
                  ],
                ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenWidth,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(sArea,
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextField(
                        maxLines: 2,
                        maxLength: 50,
                        maxLengthEnforced: true,
                        controller: _areaEditingController,
                        decoration: InputDecoration(
                          hintText: sDescription,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.amber,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenWidth,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text("$sCleaningPeriod (days/per week)",
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        maxLength: 1,
                        maxLengthEnforced: true,
                        controller: _cleaningPeriodEditingController,
                        decoration: InputDecoration(
                          hintText: sHowManyDaysPerWeek,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.amber,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
              SizedBox(
                height: 10,
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
                  // onPressed: () => showConfirmSubmit(context, binData, _messageEditingController),
                  onPressed: () {
                    if (fTState == null || district == null || subDistrict == null || _areaEditingController.text.isEmpty || _cleaningPeriodEditingController.text.isEmpty)
                      showFTStateOrDistrictOrSubDistrictOrAreaOrCleaningPeriodCannotBeEmpty(context);
                    else {
                      String area = _areaEditingController.text.toString();
                      String cleaningPeriod = _cleaningPeriodEditingController.text.toString() + " $sDaysPerWeek";
                      if (area.startsWith("-") || area.startsWith("None") || area.startsWith("none"))
                        showPleaseSetAValidAreaName(context);
                      else {
                        if (int.parse(cleaningPeriod[0]) > 7 || int.parse(cleaningPeriod[0]) == 0)
                          showPleaseSetInRange1To7Days(context);
                        else {
                          Bin bin = Bin(binID, fTState, district, subDistrict, area, cleaningPeriod);
                          d.editBin(bin);
                          showUpdateSuccess(context);
                        }
                      }
                    }
                  },
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

    return StatefulBuilder(builder: (context, setState) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            alignment: Alignment.center,
            child: Stack(
              children: [
                BackgroundPainter(),
                Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconAndTitle(screenWidth: screenWidth),
                        Text(sUpdateBins,
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
                ArrowBackPop(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
