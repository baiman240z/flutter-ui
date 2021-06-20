import 'package:flutter/material.dart';
import 'classes/util.dart';

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
      drawer: Util.drawer(context),
    );
  }

  Widget _build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      children: <Widget>[
        // -------------------------------------------------------------
        // Simple ButtonStyle
        // -------------------------------------------------------------
        SizedBox(height: 20.0,),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
          ),
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: const Text(
                'Simple ButtonStyle',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              )
          ),
        ),

        // -------------------------------------------------------------
        // Rounded border
        // -------------------------------------------------------------
        SizedBox(height: 20.0,),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            primary: Colors.tealAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
          ),
          child: const Text(
            'Rounded border',
            style: TextStyle(color: Colors.teal, fontSize: 16.0),
          ),
        ),

        // -------------------------------------------------------------
        // Shadow
        // -------------------------------------------------------------
        SizedBox(height: 20.0,),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            primary: Colors.indigo,
            elevation: 16.0,
          ),
          child: const Text(
            'Shadow',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),

        // -------------------------------------------------------------
        // Outlined
        // -------------------------------------------------------------
        SizedBox(height: 20.0,),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            primary: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            side: const BorderSide(
              color: Colors.green,
              width: 3.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Outlined',
              style: TextStyle(color: Colors.teal, fontSize: 16.0),
            ),
          ),
        ),

        // -------------------------------------------------------------
        // Icon
        // -------------------------------------------------------------
        SizedBox(height: 20.0,),
        ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.deepOrange,
            onPrimary: Colors.white,
          ),
          icon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: const Icon(
              Icons.tag_faces,
              color: Colors.white,
            ),
          ),
          label: const Text(
            'Icon',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),

        // -------------------------------------------------------------
        // Decorated
        // -------------------------------------------------------------
        SizedBox(height: 20.0,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF173F5F),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)
            ),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: const Text(
                  "Decorated",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Transform.translate(
                offset: Offset(10.0, 0.0),
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)
                        )
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: const Color(0xFF173F5F),
                    ),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
