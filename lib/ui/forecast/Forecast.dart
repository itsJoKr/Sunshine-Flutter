import 'package:flutter/material.dart';

import 'package:sunshine/model/ForecastData.dart';
import 'package:sunshine/network/ApiClient.dart';
import 'package:sunshine/res/Res.dart';

import 'dart:async';
import 'package:sunshine/ui/forecast/ForecastPager.dart';
import 'package:flutter_flux/src/store_watcher.dart';

class Forecast extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ForecastState();
  }
}

class _ForecastState extends State<Forecast> {
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

  static List<List<ForecastWeather>> groupForecastListByDay(
      ForecastData forecastData) {
    if (forecastData == null) return null;

    List<List<ForecastWeather>> forecastListByDay = [];
    final forecastList = forecastData.forecastList;

    int currentDay = forecastList[0].dateTime.day;
    List<ForecastWeather> intermediateList = [];

    for (var forecast in forecastList) {
      if (currentDay == forecast.dateTime.day) {
        intermediateList.add(forecast);
      } else {
        forecastListByDay.add(intermediateList);
        currentDay = forecast.dateTime.day;
        intermediateList = [];
        intermediateList.add(forecast);
      }
    }

    forecastListByDay.add(intermediateList);
    return forecastListByDay;
  }

  @override
  Widget build(BuildContext context) {

    return new Stack(
      children: <Widget>[
        new Image(
          image: new AssetImage("assets/img/bottom_parisback.png"),
          fit: BoxFit.fitWidth,
        ),
        new Container(
          child: new ForecastPager(groupForecastListByDay(this._forecastData)),
          decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.only(
                topLeft: new Radius.circular(15.0),
                topRight: new Radius.circular(15.0),
              ),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    offset: new Offset(0.0, -10.0))
              ]),
        ),
      ],
    );
  }
}



