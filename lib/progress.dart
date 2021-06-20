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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: _build(),
        ),
      ),
      drawer: Util.drawer(context),
    );
  }

  Widget _build() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        LinearProgressIndicator(value: progress / 100,),
        SizedBox(height: 20.0,),
        Center(child: Text("$progress%")),
        SizedBox(height: 20.0,),
        Row(
          children: [
            Expanded(child: ElevatedButton(
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
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: const Color(0xFF4aa0d5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
              ),
              child: const Text(
                'START',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            )),
          ],
        ),
        SizedBox(height: 20.0,),
        Row(
          children: [
            Expanded(child: ElevatedButton(
              onPressed: () {
                setState(() {
                  canceled = true;
                  progress = 0;
                });
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
              ),
              child: const Text(
                'STOP',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ))
          ],
        ),
      ],
    );
  }
}
