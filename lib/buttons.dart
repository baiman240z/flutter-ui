import 'package:flutter/material.dart';
import 'parts/sidemenu.dart';

class Buttons extends StatefulWidget {
  @override
  ButtonsState createState() => new ButtonsState();
}

class ButtonsState extends State<Buttons> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
      ),
      body: _build(context),
      drawer: SideMenu.drawer(context),
    );
  }

  Widget _build(BuildContext context) {
    return SafeArea(
      child: Form(
        autovalidate: false,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          children: <Widget>[
            // -------------------------------------------------------------
            // Simple Raised button
            // -------------------------------------------------------------
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: RaisedButton(
                color: Colors.blueAccent,
                splashColor: Colors.yellow,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: const Text(
                    'Simple Raised',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  )
                ),
                onPressed: () {},
              ),
            ),

            // -------------------------------------------------------------
            // Simple Flat button
            // -------------------------------------------------------------
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
                color: Color(0xFFED553B),
                splashColor: Colors.yellow,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: Text(
                      "Simple Flat",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
                onPressed: () {},
              ),
            ),

            // -------------------------------------------------------------
            // Decorated button
            // -------------------------------------------------------------
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                      color: Color(0xFF173F5F),
                      splashColor: Colors.yellow,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "Decorated Flat",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Transform.translate(
                            offset: Offset(15.0, 0.0),
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(28.0)),
                                splashColor: Colors.white,
                                color: Colors.white,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xFF173F5F),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          )
                        ],
                      ),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
