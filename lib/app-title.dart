import 'package:flutter/material.dart';
import 'package:ui/classes/util.dart';

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(),
            SizedBox(width: 8.0,),
            const Text(
                'AppBar title',
                style: TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold
                )
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(child: const Text('AppBar title'),),
      ),
      drawer: Util.drawer(context),
    );
  }
}
