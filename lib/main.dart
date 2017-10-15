import 'package:flutter/material.dart';
import 'package:sunshine/HomePage.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: new HomePage(),
    );
  }
}

class Pages {
  static const HOME = "/";
  static const DETAIL = "/detail";
}

var theme = new ThemeData (
  primarySwatch: Colors.blue
);

