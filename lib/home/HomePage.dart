import 'package:flutter/material.dart';
import 'package:sunshine/home/Weather.dart';
import 'ForecastList.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sunshine"),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Expanded(child: new Weather()),
            new Expanded(child: new ForecastList()),
          ],
        )
      ),
    );
  }
}