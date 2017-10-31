import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sunshine/model/ForecastData.dart';
import 'package:sunshine/ui/forecast_detail/ForecastDetail.dart';

final monthFormat = new DateFormat('MMMM');

class ForecastDetailPage extends StatelessWidget {
  ForecastWeather weather;

  ForecastDetailPage(this.weather);

  static MaterialPageRoute getRoute(ForecastWeather forecastWeather) {
    return new MaterialPageRoute(builder: (BuildContext context) {
      return new ForecastDetailPage(forecastWeather);
    });
  }

  @override
  Widget build(BuildContext context) {
    var title = weather.dateTime.hour.toString() + "h";
    var month = monthFormat.format(weather.dateTime);
    title += " • " + weather.dateTime.day.toString() + " " + month;

    return new Scaffold(
      appBar: new AppBar(title: new Text(title)),
      body: new Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    const Color(0x99336600),
                    const Color(0x9900CCFF),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.7, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp)),
          child: new Center(
            child: new ForecastDetail(weather),
          )),
    );
  }
}
