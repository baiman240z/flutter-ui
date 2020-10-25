import 'package:flutter/material.dart';
import 'classes/util.dart';

class Grid extends StatefulWidget {
  @override
  GridState createState() => new GridState();
}

class GridState extends State<Grid> {
  List<String> items = [
    '001',
    '002',
    '003',
    '004',
    '005',
    '006',
    '007',
    '008',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: _grid(context),
      ),
      drawer: Util.drawer(context),
    );
  }

  Widget _grid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 20.0,
      crossAxisSpacing: 20.0,
      children: items.map((String value) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.green[100],
            border: Border.all(
              color: Colors.green[900],
              width: 1.0,
            ),
          ),
          child: Center(child: Text(value),),
        );
      }).toList(),
    );
  }
}
