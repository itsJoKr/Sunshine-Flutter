import 'package:flutter/material.dart';
import 'package:flutter_flux/flutter_flux.dart';

import 'package:sunshine/res/Res.dart';
import 'package:sunshine/store/ForecastStore.dart';

import 'package:sunshine/ui/forecast/ForecastPager.dart';
import 'package:flutter_flux/src/store_watcher.dart';

class Forecast extends StoreWatcher {

  @override
  Widget build(BuildContext context, Map<StoreToken, Store> stores) {
    ForecastStore store = stores[forecastStoreToken];
    if (store.forecastByDay == null) return new Container();

    return new Stack(
      children: <Widget>[
        new Image(
          image: new AssetImage("assets/img/bottom_parisback.png"),
          fit: BoxFit.fitWidth,
        ),
        new Container(
          child: new ForecastPager(store.forecastByDay),
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


  @override
  void initStores(ListenToStore listenToStore) {
    listenToStore(forecastStoreToken);
    updateForecast.call(); // Initial load
  }
}




