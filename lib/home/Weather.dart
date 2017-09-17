import 'package:flutter/material.dart';
import 'package:sunshine/model/WeatherData.dart';
import 'package:sunshine/network/ApiClient.dart';

import 'dart:async';

class Weather extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _WeatherState();
  }
}

class _WeatherState extends State<Weather> {
  var _weather = new WeatherData("", "Loading");

  @override
  void initState() {
    super.initState();

    var apiClient = ApiClient.getInstance();

    Future<WeatherData> fWeatherData = apiClient.getWeather();
    fWeatherData.then((content) => this.setState((){ this._weather = content; }))
        .catchError((e) => this.setState(() { this._weather = new WeatherData("", "Error while fetching data!"); }));
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(this._weather.temperature, style: new TextStyle(fontSize: 30.0)),
          new Text(this._weather.weather),
        ],
      ),
    );
  }


}
