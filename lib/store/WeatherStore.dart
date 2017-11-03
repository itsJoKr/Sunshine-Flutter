import 'dart:async';

import 'package:flutter_flux/flutter_flux.dart';
import 'package:sunshine/model/Condition.dart';
import 'package:sunshine/model/WeatherData.dart';
import 'package:sunshine/network/ApiClient.dart';

class WeatherStore extends Store {

  WeatherData weatherData;

  WeatherStore() {
    // TODO make loading widget from here
    this.weatherData = new WeatherData("", new Condition(0, "Loading"));

    triggerOnAction(actionUpdateWeather, (String value) {
      _updateWeather();
    });
  }

  void _updateWeather() {
    var apiClient = ApiClient.getInstance();
    Future<WeatherData> fWeatherData = apiClient.getWeather();
    fWeatherData
        .then((content) {
          this.weatherData = content;
          trigger();
    }).catchError((e) {
        this.weatherData = null;
        // todo trigger error
    });
  }

}

// Token and actions
final Action<String> actionUpdateWeather = new Action<String>();
final StoreToken weatherStoreToken = new StoreToken(new WeatherStore());