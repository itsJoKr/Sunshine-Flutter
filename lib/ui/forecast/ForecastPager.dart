import 'package:flutter/material.dart';

import 'package:sunshine/model/ForecastData.dart';
import 'package:sunshine/res/Res.dart';

import 'package:intl/intl.dart';
import 'package:sunshine/ui/forecast/ForecastList.dart';
import 'package:sunshine/ui/widgets/DotPageIndicator.dart';
import 'package:sunshine/ui/widgets/TextWithExponent.dart';

final weekdayFormat = new DateFormat('EEE');

class ForecastPager extends StatefulWidget {
  var _forecastByDay;
  ForecastPager(this._forecastByDay);

  @override
  _ForecastPagerState createState() {
    return new _ForecastPagerState(_forecastByDay);
  }
}

class _ForecastPagerState extends State<ForecastPager> {
  var currentPage = 0;
  List<List<ForecastWeather>> _forecastByDay;

  _ForecastPagerState(List<List<ForecastWeather>> _forecastByDay);

  @override
  void didUpdateWidget(ForecastPager oldWidget) {
    setState(() {
      this._forecastByDay = widget._forecastByDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime currentDateTime;
    final pageCount = _forecastByDay != null ? _forecastByDay.length : 0;

    if (_forecastByDay != null) {
      if (_forecastByDay[currentPage].length > 0) {
        currentDateTime = _forecastByDay[currentPage][0].dateTime;
      }
    }

    return new Column(
      children: <Widget>[
        new _ForecastWeekTabs(currentDateTime, currentPage, pageCount),
        new Expanded(
            child: new PageView.builder(
              itemBuilder: (BuildContext context, int index) =>
              new ForecastList(_forecastByDay[index]),
              itemCount: pageCount,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) => this.setState(() {this.currentPage = index;}),
            )),
      ],
    );
  }
}

class _ForecastWeekTabs extends StatelessWidget {
  final DateTime dateTime;
  final int currentPage;
  final int pageCount;

  _ForecastWeekTabs(this.dateTime, this.currentPage, this.pageCount);


  @override
  Widget build(BuildContext context) {
    final textStyle = new TextStyle(fontSize: 24.0);
    final int dayOfMonth = dateTime != null ? dateTime.day : 0;
    String dayMonthSuffix = "";

    final weekDay = weekdayFormat.format(dateTime).toString();
    if (dayOfMonth == 1) {
      dayMonthSuffix += "st";
    } else if (dayOfMonth == 2) {
      dayMonthSuffix += "nd";
    } else {
      dayMonthSuffix += "th";
    }


    return new Container(
      child: new Container(
        child: new Stack(
          children: <Widget>[
            new Container(
              child: new Text(weekDay, style: textStyle),
              padding: new EdgeInsets.only(left: 36.0),
            ),
            new Align(
              child: new DotPageIndicator(this.currentPage, this.pageCount),
              alignment: FractionalOffset.center,
            ),
            new Positioned(
                child: new TextWithExponent(
                  dayOfMonth.toString(),
                  dayMonthSuffix,
                  textSize: 24.0,
                  exponentTextSize: 18.0,
                ),
                right: 36.0),
          ],
        ),
        padding: new EdgeInsets.symmetric(vertical: 8.0),
      ),
      decoration: new BoxDecoration(
          border: new Border(bottom: new BorderSide(color: Colors.black12))),
    );
  }
}

