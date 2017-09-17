import 'package:http/http.dart' as http;

import 'package:sunshine/model/WeatherData.dart';
import 'package:sunshine/model/ForecastData.dart';

import 'dart:async';

class ApiClient {
  static ApiClient _instance = null;

  static ApiClient getInstance() {
    if (_instance == null) {
      _instance = new ApiClient();
    }
    return _instance;
  }


  Future<WeatherData> getWeather() async {
    http.Response response = await http.get(
      Uri.encodeFull(Endpoints.WEATHER),
      headers: {
        "Accept": "application/json"
      }
    );

    return WeatherData.deserialize(response.body);
  }

  Future<ForecastData> getForecast() async {
    http.Response response = await http.get(
      Uri.encodeFull(Endpoints.FORECAST),
      headers: {
        "Accept": "application/json"
      }
    );

    return ForecastData.deserialize(response.body);
  }

}

class Endpoints {
  static const _ENDPOINT = "http://api.openweathermap.org/data/2.5";
  static const WEATHER = _ENDPOINT + "/weather?lat=43.509645&lon=16.445783&APPID=af29567e139fe06b6c2d050515cdff0c&units=metric";
  static const FORECAST = _ENDPOINT + "/forecast?lat=43.509645&lon=16.445783&APPID=af29567e139fe06b6c2d050515cdff0c&units=metric";
}