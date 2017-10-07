import 'package:flutter/material.dart';

import 'package:sunshine/model/ForecastData.dart';
import 'package:sunshine/network/ApiClient.dart';

import 'dart:async';
import 'package:intl/intl.dart';

final timeFormat = new DateFormat('EEEE HH:mm');

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
    return new Stack(
      children: <Widget>[
        new Image(
          image: new AssetImage("assets/img/bottom_parisback.png"),
          fit: BoxFit.fitWidth,
        ),
        new Container(
          child: new ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                new _ForecastListItem(_forecastData.forecastList[index]),
            itemCount:
                _forecastData == null ? 0 : _forecastData.forecastList.length,
          ),
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

class _ForecastListItem extends StatelessWidget {
  final ForecastWeather weather;

  _ForecastListItem(this.weather);

  @override
  Widget build(BuildContext context) {
    final time = timeFormat.format(weather.dateTime);
//    final time = "${weather.dateTime.hour}:${weather.dateTime.minute}";

    return new Container(
        padding: new EdgeInsets.all(12.0),
        child: new Stack(
          children: <Widget>[
            new Text(
              time,
              style: new TextStyle(fontSize: 18.0),
            ),
            new Positioned(
              child: new Row(
                children: <Widget>[
                  new Container(
                    child: new Text(weather.description),
                    margin: new EdgeInsets.only(right: 8.0),
                  ),
                  new Container(
                    width: 80.0,
                    alignment: FractionalOffset.centerRight,
                      child: new Text(
                        weather.temperature + "°C",
                        style: new TextStyle(fontSize: 20.0),
                      ),
                  ),
                ],
              ),
              right: 0.0,
            )
          ],
        ));
  }
}

//new Row(children: <Widget>[
//new Text(
//weather.temperature + "°C",
//style: new TextStyle(fontSize: 16.0),
//),
//new Text(weather.description),
//],)
