import 'dart:async';

import 'package:flutter_flux/flutter_flux.dart';
import 'package:sunshine/model/ForecastData.dart';
import 'package:sunshine/network/ApiClient.dart';


class ForecastStore extends Store {

  /// Forecast by day: list of days with each containing list of
  /// [ForecastWeather] through day
  List<List<ForecastWeather>> forecastByDay;

  ForecastStore() {

    triggerOnAction(updateForecast, (dynamic) {
      _updateForecast();
    });
  }

  _updateForecast() {
    Future<ForecastData> fForecastData = ApiClient.getInstance().getForecast();
    fForecastData.then((content) {
      ForecastData forecastData = content;
      this.forecastByDay = groupForecastListByDay(forecastData);
      trigger();
    }).catchError((e) {
      print(e);
    });
  }

  static List<List<ForecastWeather>> groupForecastListByDay(
      ForecastData forecastData) {
    if (forecastData == null) return null;

    List<List<ForecastWeather>> forecastListByDay = [];
    final forecastList = forecastData.forecastList;

    int currentDay = forecastList[0].dateTime.day;
    List<ForecastWeather> intermediateList = [];

    for (var forecast in forecastList) {
      if (currentDay == forecast.dateTime.day) {
        intermediateList.add(forecast);
      } else {
        forecastListByDay.add(intermediateList);
        currentDay = forecast.dateTime.day;
        intermediateList = [];
        intermediateList.add(forecast);
      }
    }

    forecastListByDay.add(intermediateList);
    return forecastListByDay;
  }

}

final Action updateForecast = new Action();
final StoreToken forecastStoreToken = new StoreToken(new ForecastStore());