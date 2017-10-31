import 'package:flutter/material.dart';
import 'package:sunshine/model/ForecastData.dart';
import 'package:sunshine/res/Res.dart';

class ForecastDetail extends StatelessWidget {
  final ForecastWeather weather;

  ForecastDetail(this.weather);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new _MainWeatherInfo(weather),
          new Container(margin: const EdgeInsets.all(20.0), height: 1.0, width: 220.0, color: Colors.black45,),
          new _WeatherInfo(weather.wind.toString(), $Asset.wind),
          new _WeatherInfo(weather.pressure.toString(), $Asset.pressure),
          new _WeatherInfo(weather.humidity.toString(), $Asset.humidity),
        ],
      ),
    );
  }
}

class _MainWeatherInfo extends StatelessWidget {
  final ForecastWeather weather;

  _MainWeatherInfo(this.weather);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          new Image.asset(
            this.weather.condition.getAssetString(),
            width: 50.0,
          ),
          new Padding(
            padding: new EdgeInsets.only(left: 16.0),
            child: new Text(
              this.weather.condition.description,
              style: new TextStyle(fontSize: 32.0),
            ),
          )
        ]));
  }
}

class _WeatherInfo extends StatelessWidget {
  final String info;
  final String imageAsset;

  _WeatherInfo(this.info, this.imageAsset);

  @override
  Widget build(BuildContext context) {
    return new Container(child: new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Image.asset(imageAsset, width: 30.0,),
        new Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 12.0, top: 12.0),
          child: new Text(info, style: new TextStyle(fontSize: 20.0),),
        )
      ],
    ));
  }
}
