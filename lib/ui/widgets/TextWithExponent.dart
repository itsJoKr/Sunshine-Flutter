import 'package:flutter/material.dart';

class TextWithExponent extends StatelessWidget {
  final String text;
  final String exponentText;
  final double textSize;
  final double exponentTextSize;

  TextWithExponent(this.text, this.exponentText, {this.textSize = 25.0, this.exponentTextSize = 18.0});

  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      new Text(text, style: new TextStyle(fontSize: textSize),),
      new Container(
        child: new Text(exponentText, style: new TextStyle(fontSize: exponentTextSize)),
        margin: new EdgeInsets.only(bottom: (textSize - exponentTextSize)),
      ),
    ],);
  }
}