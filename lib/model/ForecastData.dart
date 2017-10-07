
import 'dart:convert';

class ForecastData {

  List<ForecastWeather> forecastList;

  ForecastData(this.forecastList);

  static ForecastData deserialize(String json) {
    JsonDecoder decoder = new JsonDecoder();
    var map = decoder.convert(json);

    var list = map["list"];
    List<ForecastWeather> forecast = [];

    for (var weatherMap in list) {
      forecast.add(ForecastWeather._deserialize(weatherMap));
    }

    return new ForecastData(forecast);
  }

}

class ForecastWeather {
  String temperature;
  String description;
  DateTime dateTime;
  //Wind, rain, etc.

  ForecastWeather(this.temperature, this.description, this.dateTime);

  static ForecastWeather _deserialize(Map<String, dynamic> map) {
    String description = map["weather"][0]["description"];
    double temperature = map["main"]["temp"].toDouble();
    int epochTimeMs = map["dt"]*1000;
    DateTime dateTime = new DateTime.fromMillisecondsSinceEpoch(epochTimeMs);

    return new ForecastWeather(temperature.toString(), description, dateTime);
  }

}
