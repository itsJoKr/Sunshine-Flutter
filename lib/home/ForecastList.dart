import 'package:flutter/material.dart';

import 'package:sunshine/model/ForecastData.dart';
import 'package:sunshine/network/ApiClient.dart';

import 'dart:async';

class ForecastList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ForecastListState();
  }
}

class _ForecastListState extends State<ForecastList> {
  ForecastData _forecastData;

  @override
  void initState() {
    Future<ForecastData> fForecastData = ApiClient.getInstance().getForecast();
    fForecastData
        .then((content) => this.setState(() {
              this._forecastData = content;
            }))
        .catchError((e) => this.setState(() {
              print(e);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          new _ForecastListItem(_forecastData.forecastList[index]),
      itemCount: _forecastData == null ? 0 : _forecastData.forecastList.length,
    );
  }
}

class _ForecastListItem extends StatelessWidget {
  final ForecastWeather weather;

  _ForecastListItem(this.weather);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        padding: new EdgeInsets.all(12.0),
        child: new Column(children: <Widget>[
          new Text(weather.temperature + "°C", style: new TextStyle(fontSize: 16.0),),
          new Text(weather.description),
        ],)
      ),
    );
  }
}
