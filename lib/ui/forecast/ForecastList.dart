import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:sunshine/model/ForecastData.dart';
import 'package:sunshine/res/Res.dart';
import 'package:sunshine/ui/ForecastDetailPage.dart';

import 'package:sunshine/ui/widgets/TextWithExponent.dart';

final timeFormat = new DateFormat('HH');

class ForecastList extends StatelessWidget {
  final List<ForecastWeather> _forecast;

  ForecastList(this._forecast);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          new _ForecastListItem(_forecast[index]),
      itemCount: _forecast == null ? 0 : _forecast.length,
    );
  }
}

class _ForecastListItem extends StatelessWidget {
  final ForecastWeather weather;

  _ForecastListItem(this.weather);

  void clicked(BuildContext context) {
    Navigator.of(context).push(ForecastDetailPage.getRoute(weather));
  }

  @override
  Widget build(BuildContext context) {
    final time = timeFormat.format(weather.dateTime);

    return new Material(
        child: new InkWell(
            onTap: () => clicked(context),
            child: new Container(
                height: 65.0,
                padding:
                    new EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: new Stack(
                  children: <Widget>[
                    new Align(
                      child: new TextWithExponent(time, "h"),
                      alignment: FractionalOffset.centerLeft,
                    ),
                    new Positioned(
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            child: new Image.asset(
                              weather.condition.getAssetString(),
                              height: 46.0,
                              width: 46.0,
                              fit: BoxFit.scaleDown,
                              color: $Colors.blueParis,
                            ),
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
                ))));
  }
}
