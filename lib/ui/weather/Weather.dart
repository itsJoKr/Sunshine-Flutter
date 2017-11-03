import 'package:flutter/material.dart';
import 'package:sunshine/model/Condition.dart';
import 'package:sunshine/model/WeatherData.dart';
import 'package:sunshine/network/ApiClient.dart';

import 'dart:async';

import 'package:sunshine/res/Res.dart';
import 'package:sunshine/store/StatelessStoreWidget.dart';
import 'package:sunshine/store/WeatherStore.dart';
import 'package:sunshine/ui/widgets/TextWithExponent.dart';
import 'package:flutter_flux/flutter_flux.dart';

class Weather extends StatelessStoreWidget {

  @override
  StoreWatcherState createState() {
    return new _WeatherState();
  }

}

class _WeatherState extends StoreWatcherState {
  WeatherData weather;

  @override
  void initState() {
    listenToStore(weatherStoreToken, (store) {
      setState(() {
        WeatherStore weatherStore = (store as WeatherStore);
        this.weather = weatherStore.weatherData;
      });
    });
    actionUpdateWeather.call();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
          image: new AssetImage($Asset.backgroundParis),
          fit: BoxFit.cover,
        )),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new WeatherInfo(this.weather),
            ),
          ],
        ));
  }
}

class WeatherInfo extends StatelessWidget {
  WeatherInfo(WeatherData this._weather);

  final WeatherData _weather;

  @override
  Widget build(BuildContext context) {
    final roundedTemperature = this._weather.temperature.split(".")[0] + "°";
    final condition = '${this._weather.condition.description[0].toUpperCase()}${this._weather
        .condition.description.substring(1)}';

    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            "Paris",
            style: new TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.w700,
                color: $Colors.blueParis),
          ),
          new Text(
            condition,
            style: new TextStyle(fontSize: 18.0, color: $Colors.blueParis,),
          ),
          new Text(roundedTemperature,
              style: new TextStyle(fontSize: 72.0, color: $Colors.blueParis, fontFamily: "Roboto")),
        ],
      ),
      padding: new EdgeInsets.only(left: 64.0),
    );
  }
}

