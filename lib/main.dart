import 'package:flutter/material.dart';
import 'package:zoper_app/screens/home_screen.dart';
import 'utilities/constants.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.green);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoper Online',
      theme: ThemeData.light().copyWith(
        brightness: Brightness.light,
        primaryColor: primaryColor,
        primaryColorDark: primaryColorDark,
        accentColor: accentColor,
        backgroundColor: primaryColor,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'ProductSans',
            fontSize: 18.0,
            color: colorBlack,
          ),
          bodyText2: TextStyle(
            color: colorBlack,
            fontFamily: 'ProductSans',
            fontSize: 18.0,
          ),
        ),
      ),
      home: HomeScreen(),
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
