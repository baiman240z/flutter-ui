import 'package:flutter/material.dart';
import 'splash.dart';
import 'forms.dart';
import 'iconlist.dart';
import 'progress.dart';

void main() => runApp(MaterialApp(
        title: 'UI recepi',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: Splash(),
        routes: <String, WidgetBuilder>{
          '/splash': (BuildContext context) => Splash(),
          '/forms': (BuildContext context) => Forms(),
          '/icons': (BuildContext context) => IconList(),
          '/progress': (BuildContext context) => Progress(),
        }));
