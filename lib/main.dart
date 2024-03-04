import 'package:appstest/Book.dart';
import 'package:appstest/buttonNavigationBottom.dart';
import 'package:appstest/home.dart';
import 'package:appstest/signIn.dart';
import 'package:flutter/material.dart';
import 'package:appstest/style/colors.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isChecked = false;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: book(),
      );
  }
}


