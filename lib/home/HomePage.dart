import 'package:flutter/material.dart';
import 'package:sunshine/home/Weather.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sunshine"),
      ),
      body: new Container(
        child: new Weather()
      ),
    );
  }
}