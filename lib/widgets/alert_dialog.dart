import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';
import 'package:waste_management/data/bin/bin.dart';
import 'package:waste_management/data/complaint/complaint.dart';
import 'package:waste_management/data/data.dart';

showUsernameOrPasswordCannotBeEmpty(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                    children: <TextSpan>[
                      TextSpan(
                          text: sUsername,
                          style: TextStyle(color: wordAndIconRed)),
                      TextSpan(text: " $sOr "),
                      TextSpan(
                          text: "$sPassword ",
                          style: TextStyle(color: wordAndIconRed)),
                      TextSpan(text: sCannotBeEmpty),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 50,
                  minWidth: 150,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
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

showNameOrEmailOrAddressCannotBeEmpty(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                    children: <TextSpan>[
                      TextSpan(
                          text: sName, style: TextStyle(color: wordAndIconRed)),
                      TextSpan(text: " $sOr "),
                      TextSpan(
                          text: sEmail,
                          style: TextStyle(color: wordAndIconRed)),
                      TextSpan(text: " $sOr "),
                      TextSpan(
                          text: "$sAddress ",
                          style: TextStyle(color: wordAndIconRed)),
                      TextSpan(text: sCannotBeEmpty),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 50,
                  minWidth: 150,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
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
    BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(5),
          content: Container(
            height: 250,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                    children: <TextSpan>[
                      TextSpan(
                          text: sFTState,
                          style: TextStyle(color: wordAndIconRed)),
                      TextSpan(text: " $sOr "),
                      TextSpan(
                          text: sDistrict,
                          style: TextStyle(color: wordAndIconRed)),
                      TextSpan(text: " $sOr "),
                      TextSpan(
                          text: sSubDistrict,
                          style: TextStyle(color: wordAndIconRed)),
                      TextSpan(text: " $sOr "),
                      TextSpan(
                          text: sArea, style: TextStyle(color: wordAndIconRed)),
                      TextSpan(text: " $sOr "),
                      TextSpan(
                          text: "$sCleaningPeriod ",
                          style: TextStyle(color: wordAndIconRed)),
                      TextSpan(text: sCannotBeEmpty),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 50,
                  minWidth: 150,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
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

showConfirmPasswordMustBeTheSameAsPassword(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                    children: <TextSpan>[
                      TextSpan(
                          text: sConfirmPassword,
                          style: TextStyle(color: wordAndIconRed)),
                      TextSpan(text: " $sMustBeTheSameAs "),
                      TextSpan(
                          text: "$sPassword ",
                          style: TextStyle(color: wordAndIconRed)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 50,
                  minWidth: 150,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
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

showPleaseUseValidEmail(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70,
                ),
                Text(sPleaseUseValidEmail,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 50,
                  minWidth: 150,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
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

showPleaseSetAValidAreaName(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70,
                ),
                Text(sPleaseSetAValidAreaName,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 50,
                  minWidth: 150,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
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

showPleaseSetInRange1To7Days(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70,
                ),
                Text(sPleaseSetInRange1To7Days,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 50,
                  minWidth: 150,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
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

showNoUsernameFound(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70,
                ),
                Text(sNoUsernameFound,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 50,
                  minWidth: 150,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
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

showWrongPassword(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70,
                ),
                Text(sWrongPassword,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 50,
                  minWidth: 150,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
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

showWrongAdminUsername(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70,
                ),
                Text(sWrongAdminUsername,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 50,
                  minWidth: 150,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
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

showUsernameHasBeenTaken(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70,
                ),
                Text(sUsernameHasBeenTaken,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 50,
                  minWidth: 150,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
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

showPleaseWriteSomeMessage(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_sharp,
                  color: wordAndIconRed,
                  size: 70,
                ),
                Text(
                  sPleaseWriteSomeMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 50,
                  minWidth: 150,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: buttonBlue,
                  child: Text(
                    sRetry,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
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

showConfirmSubmit(BuildContext context, Bin bin, String userID,
    String message) {
  List<String> binKeys = bin.getBinData().keys.toList();

  showDialog(
    context: context,
    builder: (context) {
      Data d = Data.getInstance();

      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text(sConfirm,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          content: SingleChildScrollView(
            child: Container(
              width: 350,
              height: 300 + 300 * message.length / 225,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (String binKey in binKeys)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 2, 0, 5),
                            child: Text(
                              binKey,
                              style: TextStyle(
                                  color: wordAndIconBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: Text(
                              bin.getBinData()[binKey],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ),
                        ),
                      ],
                    ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 2, 0, 5),
                    child: Text(sMessage,
                        style: TextStyle(
                            color: wordAndIconBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ),
                  Text(
                    message,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 50,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: buttonBlue,
                          child: Text(
                            sCancel,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          // textColor: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 50,
                          onPressed: () {
                            String complaintID = d.getNewID(BoxType.complaint);
                            String commentMessage = "";
                            String status = sPending;
                            Complaint complaint = Complaint(complaintID, userID, bin, message, commentMessage, status);
                            d.addComplaint(complaint);
                            Navigator.of(context).pop();
                            showSubmitSuccess(context, complaintID);
                          },
                          color: buttonGreen,
                          child: Text(
                            sSubmit,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

showRegisterUserSuccess(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.thumb_up,
                  color: wordAndIconBlue,
                  size: 70,
                ),
                Text(
                  sRegisterUserSuccessfully,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 50,
                  minWidth: 150,
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
                        fontSize: 22),
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

showSubmitSuccess(BuildContext context, String complaintID) {
  showDialog(
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.thumb_up,
                  color: wordAndIconBlue,
                  size: 70,
                ),
                Text(
                  sSubmitSuccessfully,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "$sComplaintID = $complaintID",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 50,
                  minWidth: 150,
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
                        fontSize: 22),
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

showSaveSuccess(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.save_alt_sharp,
                  color: wordAndIconBlue,
                  size: 70,
                ),
                Text(
                  sSaveSuccessfully,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 50,
                  minWidth: 150,
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
                        fontSize: 22),
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

showCreateSuccess(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.done_outline_sharp,
                  color: wordAndIconBlue,
                  size: 70,
                ),
                Text(
                  sCreateSuccessfully,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 50,
                  minWidth: 150,
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
                        fontSize: 22),
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

showUpdateSuccess(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.save_sharp,
                  color: wordAndIconBlue,
                  size: 70,
                ),
                Text(
                  sUpdateSuccessfully,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 50,
                  minWidth: 150,
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
                        fontSize: 22),
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
