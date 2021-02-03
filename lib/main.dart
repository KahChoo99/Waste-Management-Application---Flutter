import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waste_management/screens/login_register/login_register.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) {
    runApp(
        MyAdaptingApp());
  });
}

class MyAdaptingApp extends StatelessWidget {
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
      home: LoginRegister(),
    );
  }
}
