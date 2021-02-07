import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/data/bin/bin.dart';
import 'package:waste_management/data/complaint/complaint.dart';
import 'package:waste_management/data/data.dart';

showUsernameOrPasswordCannotBeEmpty(
    BuildContext context, double widthRatio, double heightRatio) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
            5 * widthRatio,
            5 * heightRatio,
            5 * widthRatio,
            5 * heightRatio,
          ),
          content: Container(
            height: 250 * heightRatio,
            width: 350 * widthRatio,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70 * heightRatio,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24 * widthRatio,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: sUsername,
                        style: TextStyle(
                          color: wordAndIconRed,
                        ),
                      ),
                      TextSpan(
                        text: " $sOr ",
                      ),
                      TextSpan(
                        text: "$sPassword ",
                        style: TextStyle(
                          color: wordAndIconRed,
                        ),
                      ),
                      TextSpan(
                        text: sCannotBeEmpty,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20 * heightRatio,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0 * heightRatio),
                  ),
                  height: 50 * heightRatio,
                  minWidth: 150 * widthRatio,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22 * widthRatio,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

showNameOrEmailOrAddressCannotBeEmpty(
    BuildContext context, double widthRatio, double heightRatio) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
            5 * widthRatio,
            5 * heightRatio,
            5 * widthRatio,
            5 * heightRatio,
          ),
          content: Container(
            height: 250 * heightRatio,
            width: 350 * widthRatio,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70 * heightRatio,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24 * widthRatio,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: sName,
                        style: TextStyle(
                          color: wordAndIconRed,
                        ),
                      ),
                      TextSpan(
                        text: " $sOr ",
                      ),
                      TextSpan(
                        text: sEmail,
                        style: TextStyle(
                          color: wordAndIconRed,
                        ),
                      ),
                      TextSpan(
                        text: " $sOr ",
                      ),
                      TextSpan(
                        text: "$sAddress ",
                        style: TextStyle(
                          color: wordAndIconRed,
                        ),
                      ),
                      TextSpan(
                        text: sCannotBeEmpty,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20 * heightRatio,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0 * heightRatio),
                  ),
                  height: 50 * heightRatio,
                  minWidth: 150 * widthRatio,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22 * widthRatio,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

showFTStateOrDistrictOrSubDistrictOrAreaOrCleaningPeriodCannotBeEmpty(
    BuildContext context, double widthRatio, double heightRatio) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
            5 * widthRatio,
            5 * heightRatio,
            5 * widthRatio,
            5 * heightRatio,
          ),
          content: Container(
            height: 250 * heightRatio,
            width: 350 * widthRatio,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70 * heightRatio,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24 * widthRatio,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: sFTState,
                        style: TextStyle(
                          color: wordAndIconRed,
                        ),
                      ),
                      TextSpan(
                        text: " $sOr ",
                      ),
                      TextSpan(
                        text: sDistrict,
                        style: TextStyle(
                          color: wordAndIconRed,
                        ),
                      ),
                      TextSpan(
                        text: " $sOr ",
                      ),
                      TextSpan(
                        text: sSubDistrict,
                        style: TextStyle(
                          color: wordAndIconRed,
                        ),
                      ),
                      TextSpan(
                        text: " $sOr ",
                      ),
                      TextSpan(
                        text: sArea,
                        style: TextStyle(
                          color: wordAndIconRed,
                        ),
                      ),
                      TextSpan(
                        text: " $sOr ",
                      ),
                      TextSpan(
                        text: "$sCleaningPeriod ",
                        style: TextStyle(
                          color: wordAndIconRed,
                        ),
                      ),
                      TextSpan(
                        text: sCannotBeEmpty,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20 * heightRatio,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0 * heightRatio),
                  ),
                  height: 50 * heightRatio,
                  minWidth: 150 * widthRatio,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22 * widthRatio,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

showConfirmPasswordMustBeTheSameAsPassword(
    BuildContext context, double widthRatio, double heightRatio) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
            5 * widthRatio,
            5 * heightRatio,
            5 * widthRatio,
            5 * heightRatio,
          ),
          content: Container(
            height: 250 * heightRatio,
            width: 350 * widthRatio,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70 * heightRatio,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24 * widthRatio,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: sConfirmPassword,
                        style: TextStyle(
                          color: wordAndIconRed,
                        ),
                      ),
                      TextSpan(
                        text: " $sMustBeTheSameAs ",
                      ),
                      TextSpan(
                        text: "$sPassword ",
                        style: TextStyle(
                          color: wordAndIconRed,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20 * heightRatio,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0 * heightRatio),
                  ),
                  height: 50 * heightRatio,
                  minWidth: 150 * widthRatio,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22 * widthRatio,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

showPleaseUseValidEmail(
    BuildContext context, double widthRatio, double heightRatio) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
            5 * widthRatio,
            5 * heightRatio,
            5 * widthRatio,
            5 * heightRatio,
          ),
          content: Container(
            height: 250 * heightRatio,
            width: 350 * widthRatio,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70 * heightRatio,
                ),
                Text(
                  sPleaseUseValidEmail,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24 * widthRatio,
                  ),
                ),
                SizedBox(
                  height: 20 * heightRatio,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0 * heightRatio),
                  ),
                  height: 50 * heightRatio,
                  minWidth: 150 * widthRatio,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22 * widthRatio,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

showPleaseSetAValidAreaName(
    BuildContext context, double widthRatio, double heightRatio) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
            5 * widthRatio,
            5 * heightRatio,
            5 * widthRatio,
            5 * heightRatio,
          ),
          content: Container(
            height: 250 * heightRatio,
            width: 350 * widthRatio,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70 * heightRatio,
                ),
                Text(
                  sPleaseSetAValidAreaName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24 * widthRatio,
                  ),
                ),
                SizedBox(
                  height: 20 * heightRatio,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0 * heightRatio),
                  ),
                  height: 50 * heightRatio,
                  minWidth: 150 * widthRatio,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22 * widthRatio,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

showPleaseSetInRange1To7Days(
    BuildContext context, double widthRatio, double heightRatio) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
            5 * widthRatio,
            5 * heightRatio,
            5 * widthRatio,
            5 * heightRatio,
          ),
          content: Container(
            height: 250 * heightRatio,
            width: 350 * widthRatio,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70 * heightRatio,
                ),
                Text(
                  sPleaseSetInRange1To7Days,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24 * widthRatio,
                  ),
                ),
                SizedBox(
                  height: 20 * heightRatio,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0 * heightRatio),
                  ),
                  height: 50 * heightRatio,
                  minWidth: 150 * widthRatio,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22 * widthRatio,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

showNoUsernameFound(
    BuildContext context, double widthRatio, double heightRatio) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
            5 * widthRatio,
            5 * heightRatio,
            5 * widthRatio,
            5 * heightRatio,
          ),
          content: Container(
            height: 250 * heightRatio,
            width: 350 * widthRatio,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70 * heightRatio,
                ),
                Text(
                  sNoUsernameFound,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24 * widthRatio,
                  ),
                ),
                SizedBox(
                  height: 20 * heightRatio,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0 * heightRatio),
                  ),
                  height: 50 * heightRatio,
                  minWidth: 150 * widthRatio,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22 * widthRatio,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

showWrongPassword(BuildContext context, double widthRatio, double heightRatio) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
            5 * widthRatio,
            5 * heightRatio,
            5 * widthRatio,
            5 * heightRatio,
          ),
          content: Container(
            height: 250 * heightRatio,
            width: 350 * widthRatio,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70 * heightRatio,
                ),
                Text(
                  sWrongPassword,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24 * widthRatio,
                  ),
                ),
                SizedBox(
                  height: 20 * heightRatio,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0 * heightRatio),
                  ),
                  height: 50 * heightRatio,
                  minWidth: 150 * widthRatio,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22 * widthRatio,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

showWrongAdminUsername(
    BuildContext context, double widthRatio, double heightRatio) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
            5 * widthRatio,
            5 * heightRatio,
            5 * widthRatio,
            5 * heightRatio,
          ),
          content: Container(
            height: 250 * heightRatio,
            width: 350 * widthRatio,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70 * heightRatio,
                ),
                Text(
                  sWrongAdminUsername,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24 * widthRatio,
                  ),
                ),
                SizedBox(
                  height: 20 * heightRatio,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0 * heightRatio),
                  ),
                  height: 50 * heightRatio,
                  minWidth: 150 * widthRatio,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22 * widthRatio,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

showUsernameHasBeenTaken(
    BuildContext context, double widthRatio, double heightRatio) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
            5 * widthRatio,
            5 * heightRatio,
            5 * widthRatio,
            5 * heightRatio,
          ),
          content: Container(
            height: 250 * heightRatio,
            width: 350 * widthRatio,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70 * heightRatio,
                ),
                Text(
                  sUsernameHasBeenTaken,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24 * widthRatio,
                  ),
                ),
                SizedBox(
                  height: 20 * heightRatio,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0 * heightRatio),
                  ),
                  height: 50 * heightRatio,
                  minWidth: 150 * widthRatio,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22 * widthRatio,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

showPleaseWriteSomeMessage(
    BuildContext context, double widthRatio, double heightRatio) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
            5 * widthRatio,
            5 * heightRatio,
            5 * widthRatio,
            5 * heightRatio,
          ),
          content: Container(
            height: 250 * heightRatio,
            width: 350 * widthRatio,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70 * heightRatio,
                ),
                Text(
                  sPleaseWriteSomeMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24 * widthRatio,
                  ),
                ),
                SizedBox(
                  height: 20 * heightRatio,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0 * heightRatio),
                  ),
                  height: 50 * heightRatio,
                  minWidth: 150 * widthRatio,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22 * widthRatio,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

showConfirmSubmit(BuildContext context, Bin bin, String userID, String message,
    double widthRatio, double heightRatio) {
  List<String> binKeys = bin.getBinData().keys.toList();

  showDialog(
    context: context,
    builder: (context) {
      Data d = Data.getInstance();

      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text(
            sConfirm,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24 * widthRatio,
            ),
          ),
          content: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                minHeight: 200 * heightRatio,
              ),
              width: 350 * widthRatio,
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
                            margin: EdgeInsets.fromLTRB(
                              0,
                              2 * heightRatio,
                              0,
                              5 * heightRatio,
                            ),
                            child: Text(
                              binKey,
                              style: TextStyle(
                                color: wordAndIconBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 15 * widthRatio,
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
                            margin: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              5 * heightRatio,
                            ),
                            child: Text(
                              bin.getBinData()[binKey],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17 * widthRatio,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                      0,
                      2 * heightRatio,
                      0,
                      5 * heightRatio,
                    ),
                    child: Text(
                      sMessage,
                      style: TextStyle(
                        color: wordAndIconBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15 * widthRatio,
                      ),
                    ),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17 * widthRatio,
                    ),
                  ),
                  SizedBox(
                    height: 20 * heightRatio,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(10.0 * heightRatio),
              ),
              height: 50 * heightRatio,
              minWidth: 100 * widthRatio,
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: buttonBlue,
              child: Text(
                sCancel,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20 * widthRatio,
                ),
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(10.0 * heightRatio),
              ),
              height: 50 * heightRatio,
              minWidth: 100 * widthRatio,
              onPressed: () {
                String complaintID = d.getNewID(BoxType.complaint);
                String commentMessage = "";
                String status = sPending;
                Complaint complaint = Complaint(complaintID, userID,
                    bin, message, commentMessage, status);
                d.addComplaint(complaint);
                Navigator.of(context).pop();
                showSubmitSuccess(
                    context, complaintID, widthRatio, heightRatio);
              },
              color: buttonGreen,
              child: Text(
                sSubmit,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20 * widthRatio,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

showRegisterUserSuccess(
    BuildContext context, double widthRatio, double heightRatio) {
  showDialog(
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
            5 * widthRatio,
            5 * heightRatio,
            5 * widthRatio,
            5 * heightRatio,
          ),
          content: Container(
            height: 250 * heightRatio,
            width: 350 * widthRatio,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.thumb_up,
                  color: wordAndIconBlue,
                  size: 70 * heightRatio,
                ),
                Text(
                  sRegisterUserSuccessfully,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24 * widthRatio,
                  ),
                ),
                SizedBox(
                  height: 20 * heightRatio,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0 * heightRatio),
                  ),
                  height: 50 * heightRatio,
                  minWidth: 150 * widthRatio,
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  color: buttonGreen,
                  child: Text(
                    sOk,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22 * widthRatio,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

showSubmitSuccess(BuildContext context, String complaintID, double widthRatio,
    double heightRatio) {
  showDialog(
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
            5 * widthRatio,
            5 * heightRatio,
            5 * widthRatio,
            5 * heightRatio,
          ),
          content: Container(
            height: 250 * heightRatio,
            width: 350 * widthRatio,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.thumb_up,
                  color: wordAndIconBlue,
                  size: 70 * heightRatio,
                ),
                Text(
                  sSubmitSuccessfully,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24 * widthRatio,
                  ),
                ),
                SizedBox(
                  height: 10 * heightRatio,
                ),
                Text(
                  "$sComplaintID = $complaintID",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15 * widthRatio,
                  ),
                ),
                SizedBox(
                  height: 10 * heightRatio,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0 * heightRatio),
                  ),
                  height: 50 * heightRatio,
                  minWidth: 150 * widthRatio,
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  color: buttonGreen,
                  child: Text(
                    sOk,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22 * widthRatio,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

showSaveSuccess(BuildContext context, double widthRatio, double heightRatio) {
  showDialog(
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
            5 * widthRatio,
            5 * heightRatio,
            5 * widthRatio,
            5 * heightRatio,
          ),
          content: Container(
            height: 250 * heightRatio,
            width: 350 * widthRatio,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.save_alt_sharp,
                  color: wordAndIconBlue,
                  size: 70 * heightRatio,
                ),
                Text(
                  sSaveSuccessfully,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24 * widthRatio,
                  ),
                ),
                SizedBox(
                  height: 20 * heightRatio,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0 * heightRatio),
                  ),
                  height: 50 * heightRatio,
                  minWidth: 150 * widthRatio,
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  color: buttonGreen,
                  child: Text(
                    sOk,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22 * widthRatio,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

showCreateSuccess(BuildContext context, double widthRatio, double heightRatio) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
            5 * widthRatio,
            5 * heightRatio,
            5 * widthRatio,
            5 * heightRatio,
          ),
          content: Container(
            height: 250 * heightRatio,
            width: 350 * widthRatio,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.done_outline_sharp,
                  color: wordAndIconBlue,
                  size: 70 * heightRatio,
                ),
                Text(
                  sCreateSuccessfully,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24 * widthRatio,
                  ),
                ),
                SizedBox(
                  height: 20 * heightRatio,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0 * heightRatio),
                  ),
                  height: 50 * heightRatio,
                  minWidth: 150 * widthRatio,
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  color: buttonGreen,
                  child: Text(
                    sOk,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22 * widthRatio,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

showUpdateSuccess(BuildContext context, double widthRatio, double heightRatio) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(
            5 * widthRatio,
            5 * heightRatio,
            5 * widthRatio,
            5 * heightRatio,
          ),
          content: Container(
            height: 250 * heightRatio,
            width: 350 * widthRatio,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.save_sharp,
                  color: wordAndIconBlue,
                  size: 70 * heightRatio,
                ),
                Text(
                  sUpdateSuccessfully,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24 * widthRatio,
                  ),
                ),
                SizedBox(
                  height: 20 * heightRatio,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0 * heightRatio),
                  ),
                  height: 50 * heightRatio,
                  minWidth: 150 * widthRatio,
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  color: buttonGreen,
                  child: Text(
                    sOk,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22 * widthRatio,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
