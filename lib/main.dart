import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui/box.dart';
import 'package:ui/grid.dart';
import 'package:ui/app-title.dart';
import 'splash.dart';
import 'buttons.dart';
import 'textfields.dart';
import 'forms.dart';
import 'iconlist.dart';
import 'progress.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  runApp(
      MaterialApp(
        title: 'UI recepi',
        theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.orange,
          dividerColor: Colors.black45,
        ),
        home: Buttons(),
        routes: <String, WidgetBuilder>{
          '/splash': (BuildContext context) => Splash(),
          '/buttons': (BuildContext context) => Buttons(),
          '/textfields': (BuildContext context) => TextFields(),
          '/forms': (BuildContext context) => Forms(),
          '/icons': (BuildContext context) => IconList(),
          '/progress': (BuildContext context) => Progress(),
          '/grid': (BuildContext context) => Grid(),
          '/box': (BuildContext context) => BoxSample(),
          '/app-title': (BuildContext context) => AppTitle(),
      })
  );

}
