import 'package:flutter/material.dart';
import 'classes/util.dart';

class Progress extends StatefulWidget {
  @override
  ProgressState createState() => new ProgressState();
}

class ProgressState extends State<Progress> {
  int progress;
  bool canceled;

  @override
  void initState() {
    super.initState();
    progress = 0;
    canceled = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress bar'),
      ),
      body: _build(),
      drawer: Util.drawer(context),
    );
  }

  Widget _build() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: LinearProgressIndicator(value: progress / 100,),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text("$progress%"),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)),
            splashColor: Colors.yellow,
            color: Color(0xFF4aa0d5),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Text(
                  "START",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ),
            onPressed: () {
              setState(() {
                canceled = false;
                progress = 0;
              });
              Future.doWhile(() {
                if (progress >= 100 || canceled) {
                  return false;
                }
                return Future.delayed(Duration(seconds: 1), () {
                  if (!canceled) {
                    setState(() {
                      progress += 10;
                    });
                  }
                  return true;
                });
              });
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)),
            splashColor: Colors.yellow,
            color: Colors.redAccent,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Text(
                  "STOP",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ),
            onPressed: () {
              setState(() {
                canceled = true;
                progress = 0;
              });
            },
          ),
        ),
      ],
    );
  }
}
