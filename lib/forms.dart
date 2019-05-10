import 'package:flutter/material.dart';
import 'parts/sidemenu.dart';

class Forms extends StatefulWidget {
  @override
  FormsState createState() => new FormsState();
}

class FormsState extends State<Forms> {
  double sliderValue;
  Map<String, bool> checks;

  @override
  void initState() {
    super.initState();
    sliderValue = 0.1;
    checks = {
      'cat': false,
      'dog': false,
      'pig': false,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other forms'),
      ),
      body: _build(context),
      drawer: SideMenu.drawer(context),
    );
  }

  Widget _buildCheckBox(String id, String text) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 0.0),
          child: Checkbox(
            value: checks[id],
            onChanged: (bool value) {
              setState(() {
                checks[id] = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text(
            text,
            style: TextStyle(color: Colors.green, fontSize: 16.0),
          ),
        ),
      ],
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
            // Slider
            // -------------------------------------------------------------
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Slider(
                      activeColor: Colors.deepOrange,
                      inactiveColor: Colors.deepOrange.withOpacity(0.2),
                      onChanged: (double value) {
                        setState(() {
                          sliderValue = value;
                        });
                      },
                      value: sliderValue,
                    ),
                  ),
                  Text('${sliderValue * 100 ~/ 1}'),
                ],
              ),
            ),

            // -------------------------------------------------------------
            // Checkbox
            // -------------------------------------------------------------
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: <Widget>[
                  _buildCheckBox('cat', 'Cat'),
                  _buildCheckBox('dog', 'Dog'),
                  _buildCheckBox('pig', 'Pig'),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
