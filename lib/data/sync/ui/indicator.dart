import 'package:filcnaplo/data/context/app.dart';
import 'package:filcnaplo/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

class SyncProgressIndicator extends StatelessWidget {
  final String text;
  final String current;
  final String max;

  SyncProgressIndicator({this.text, this.current, this.max});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      decoration: BoxDecoration(
        color: TinyColor(app.settings.theme.backgroundColor).darken(8).color,
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 16.0,
            height: 16.0,
            margin: EdgeInsets.only(left: 18.0),
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation<Color>(
                textColor(app.settings.theme.backgroundColor),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(children: <Widget>[
                Text(text),
                Spacer(),
                app.debugVersion ? Text("$current/$max") : Container(),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
