import 'package:flutter/material.dart';
import 'classes/util.dart';

class BoxSample extends StatefulWidget {
  @override
  BoxSampleState createState() => new BoxSampleState();
}

class BoxSampleState extends State<BoxSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Box'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey,
                    ),
                  ]
              ),
              padding: EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey,
                    ),
                  ]
              ),
              child: Image.asset('assets/ss.png'),
            ),
            SizedBox(height: 10,),
            Container(
              width: 200,
              height: 150,
              child: Stack(
                children: [
                  Image.asset('assets/ss.png'),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 60,),
                        const Text(
                          'SS検索',
                          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      drawer: Util.drawer(context),
    );
  }

}
