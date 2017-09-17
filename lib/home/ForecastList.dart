import 'package:flutter/material.dart';

class ForecastList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemBuilder: null,
        itemCount: 0,
    );
  }
}

class _ForecastListItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Text("Item"),
    );
  }
}