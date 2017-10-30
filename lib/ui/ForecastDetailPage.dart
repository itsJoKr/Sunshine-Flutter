import 'package:flutter/material.dart';
import 'package:sunshine/model/ForecastData.dart';

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

    return new Scaffold(
      appBar: new AppBar(title: new Text("Yolo")),
      body: new Center(child: new Text(weather.pressure.toString()),),
    );
  }
}
