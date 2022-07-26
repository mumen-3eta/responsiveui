import 'package:flutter/material.dart';
import 'package:responsiveui/firstPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  bool isDark = false;
  changeTheme(bool value) {
    isDark = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: isDark ? ThemeData.dark() : ThemeData.light(),
        home: FirstPage(isDark, changeTheme));
  }
}
