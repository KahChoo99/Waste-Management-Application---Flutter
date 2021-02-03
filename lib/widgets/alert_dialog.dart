import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:waste_management/constants/strings.dart';
import 'package:waste_management/constants/themes.dart';

showConfirmSubmit(
    BuildContext context,
    Map<String, String> binData,
    TextEditingController _messageEditingController
    ) {
  List<String> binKeys = binData.keys.toList();

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: Text(sConfirm,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
      content: SingleChildScrollView(
        child: Container(
          width: 350,
            height: 250 + 100 * _messageEditingController.text.length / 225,
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
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: Text(binKey,
                            style: TextStyle(color: wordAndIconBlue, fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: Text(binData[binKey],
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(sMessage,
                    style: TextStyle(color: wordAndIconBlue, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              Text(
                  _messageEditingController.text.isNotEmpty ? _messageEditingController.text : sNoDescription,
                  style: TextStyle(fontSize: 16),
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
                        child: Text(sCancel,
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
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
                          Navigator.of(context).pop();
                          showSubmitSuccess(context);
                        },
                        color: buttonGreen,
                        child: Text(sSubmit,
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
                        // textColor: Colors.black,
                      ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    )
  );
}

showSubmitSuccess(BuildContext context) {
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('yyyyMMdd');
  String dateString = formatter.format(now);

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
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
            Text(sSubmitSuccessfully,
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            SizedBox(
              height: 10,
            ),
            Text("$sComplaintID = ${dateString}0001",
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
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
              child: Text(sOk,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22)),
              // textColor: Colors.black,
            ),
          ],
        ),
      ),
    )
  );
}

showSaveSuccess(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
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
              Text(sSaveSuccessfully,
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
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
                child: Text(sOk,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22)),
                // textColor: Colors.black,
              ),
            ],
          ),
        ),
      )
  );
}

showCreateSuccess(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
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
              Text(sCreateSuccessfully,
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
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
                child: Text(sOk,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22)),
                // textColor: Colors.black,
              ),
            ],
          ),
        ),
      )
  );
}

showUpdateSuccess(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
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
              Text(sUpdateSuccessfully,
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
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
                child: Text(sOk,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22)),
                // textColor: Colors.black,
              ),
            ],
          ),
        ),
      )
  );
}
