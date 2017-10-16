import 'package:flutter/material.dart';
import 'package:sunshine/ui/forecast/Forecast.dart';
import 'package:sunshine/ui/weather/Weather.dart';
class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Column(
          children: <Widget>[
            new AspectRatio(child: new Weather(), aspectRatio: 750.0/805.0),
            new Expanded(child: new Forecast()),
          ],
        )
      ),
    );
  }
}