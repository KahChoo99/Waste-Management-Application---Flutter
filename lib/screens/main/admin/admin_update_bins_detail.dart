import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/constants/values.dart';
import 'package:waste_management/data/bin/bin.dart';
import 'package:waste_management/data/data.dart';
import 'package:waste_management/widgets/arrow_back_pop.dart';
import 'package:waste_management/widgets/curve_painter.dart';
import 'package:waste_management/widgets/custom_decoration.dart';
import 'package:waste_management/widgets/icon_and_title.dart';
import 'package:waste_management/widgets/alert_dialog.dart';
import 'package:waste_management/widgets/text_input_formatter.dart';

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
  TextEditingController _cleaningPeriodEditingController =
      TextEditingController();

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

    double widthRatio = screenWidth / dDemoWidth;
    double heightRatio = screenHeight / dDemoHeight;

    String binID = widget.binData[sBinID];

    if (fTState != null) {
      if (district == null) {
        districtList =
            list_sFTState_sDistrict_SubDistrict[fTState].keys.toList();
      } else {
        subDistrictList =
            list_sFTState_sDistrict_SubDistrict[fTState][district];
      }
    } else {
      fTState = widget.binData[sFTState];
      district = widget.binData[sDistrict];
      districtList = list_sFTState_sDistrict_SubDistrict[fTState].keys.toList();
      subDistrict = widget.binData[sSubDistrict];
      subDistrictList = list_sFTState_sDistrict_SubDistrict[fTState][district];
      _areaEditingController.text = widget.binData[sArea];
      _cleaningPeriodEditingController.text =
          widget.binData[sCleaningPeriod][0];
    }

    var allValues = [fTState, district, subDistrict];
    var allDropDownList = [fTStateList, districtList, subDistrictList];
    var hintTextList = [fTStateHint, districtHint, subDistrictHint];

    Column cardList = Column(
      children: [
        SizedBox(
          height: 10 * heightRatio,
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
              for (var i = 0; i < allDropDownList.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                        10 * widthRatio,
                        0,
                        10 * widthRatio,
                        0,
                      ),
                      child: Text(
                        columnType[i],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16 * widthRatio,
                        ),
                      ),
                    ),
                    Container(
                        width: screenWidth,
                        height: 50 * heightRatio,
                        margin: EdgeInsets.fromLTRB(
                          10 * widthRatio,
                          0,
                          10 * widthRatio,
                          15 * heightRatio,
                        ),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(10.0 * heightRatio),
                            border: Border.all()),
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
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: (defaultTextFieldFontSize + 2) *
                                          widthRatio,
                                    ),
                                  ),
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
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: screenWidth,
                  margin: EdgeInsets.fromLTRB(
                    10 * widthRatio,
                    0,
                    10 * widthRatio,
                    0,
                  ),
                  child: Text(
                    sArea,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16 * widthRatio,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                    10 * widthRatio,
                    0,
                    10 * widthRatio,
                    0,
                  ),
                  child: TextField(
                    maxLines: 2,
                    maxLength: 50,
                    maxLengthEnforced: true,
                    inputFormatters: [
                      ModifiedLengthLimitingTextInputFormatter(50)
                    ],
                    controller: _areaEditingController,
                    decoration: InputDecoration(
                      hintText: sDescription,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0 * heightRatio),
                        borderSide: BorderSide(
                          color: Colors.amber,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: (defaultTextFieldFontSize + 2) * widthRatio,
                    ),
                  ),
                ),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: screenWidth,
                  margin: EdgeInsets.fromLTRB(
                    10 * widthRatio,
                    0,
                    10 * widthRatio,
                    0,
                  ),
                  child: Text(
                    "$sCleaningPeriod (days/per week)",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16 * widthRatio,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                    10 * widthRatio,
                    0,
                    10 * widthRatio,
                    0,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    maxLength: 1,
                    maxLengthEnforced: true,
                    inputFormatters: [
                      ModifiedLengthLimitingTextInputFormatter(1)
                    ],
                    controller: _cleaningPeriodEditingController,
                    decoration: InputDecoration(
                      hintText: sHowManyDaysPerWeek,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0 * heightRatio),
                        borderSide: BorderSide(
                          color: Colors.amber,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: (defaultTextFieldFontSize + 2) * widthRatio,
                    ),
                  ),
                ),
              ]),
              SizedBox(
                height: 10 * heightRatio,
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
                  onPressed: () {
                    if (fTState == null ||
                        district == null ||
                        subDistrict == null ||
                        _areaEditingController.text.isEmpty ||
                        _cleaningPeriodEditingController.text.isEmpty)
                      showFTStateOrDistrictOrSubDistrictOrAreaOrCleaningPeriodCannotBeEmpty(
                          context, widthRatio, heightRatio);
                    else {
                      String area = _areaEditingController.text.toString();
                      String cleaningPeriod =
                          _cleaningPeriodEditingController.text.toString() +
                              " $sDaysPerWeek";
                      if (area == "-" || area == "None" || area == "none")
                        showPleaseSetAValidAreaName(context, widthRatio, heightRatio);
                      else {
                        if (int.parse(cleaningPeriod[0]) > 7 ||
                            int.parse(cleaningPeriod[0]) == 0)
                          showPleaseSetInRange1To7Days(context, widthRatio, heightRatio);
                        else {
                          Bin bin = Bin(binID, fTState, district, subDistrict,
                              area, cleaningPeriod);
                          d.editBin(bin);
                          showUpdateSuccess(context, widthRatio, heightRatio);
                        }
                      }
                    }
                  },
                  color: buttonBlue,
                  child: Text(
                    sUpdate,
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

    return StatefulBuilder(
      builder: (context, setState) {
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
                            height: 40 * heightRatio,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconAndTitle(widthRatio: widthRatio, heightRatio: heightRatio,),
                              Text(
                                sUpdateBins,
                                textAlign: TextAlign.center,
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
      },
    );
  }
}
