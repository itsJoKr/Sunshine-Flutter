import 'package:flutter/material.dart';
import 'package:sunshine/home/Weather.dart';
import 'package:sunshine/ui/forecast/Forecast.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Column(
          children: <Widget>[
            new AspectRatio(child: new Weather(), aspectRatio: 750.0/815.0),
            new Expanded(child: new Forecast()),
          ],
        )
      ),
    );
  }
}