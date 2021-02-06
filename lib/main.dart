import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:waste_management/data/bin/bin.dart';
import 'package:waste_management/data/complaint/complaint.dart';
import 'package:waste_management/data/data.dart';
import 'package:waste_management/data/user/user.dart';
import 'package:waste_management/data/userProfile/userProfile.dart';
import 'package:waste_management/screens/login_register/login_register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(BinAdapter());
  Hive.registerAdapter(ComplaintAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(UserProfileAdapter());
  await Data.getInstance().init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) {
    runApp(
        MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solid Waste Management App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      darkTheme: ThemeData.light(),
      builder: (context, child) {
        return CupertinoTheme(
          data: CupertinoThemeData(),
          child: Material(child: child),
        );
      },
      home: LoginRegister()
    );
  }
}
