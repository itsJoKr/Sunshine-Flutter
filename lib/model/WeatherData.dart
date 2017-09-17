
import 'dart:convert';

class WeatherData {
  String temperature;
  String weather;

  WeatherData(this.temperature, this.weather);

  static WeatherData deserialize(String json) {
    JsonDecoder decoder = new JsonDecoder();
    var map = decoder.convert(json);

    String description = map["weather"][0]["description"];
    double temperature = map["main"]["temp"].toDouble();

    return new WeatherData(temperature.toString(), description);
  }

}

