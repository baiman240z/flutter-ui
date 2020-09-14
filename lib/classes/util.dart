import 'package:flutter/material.dart';

class Util {
  static Drawer drawer(BuildContext context) {
    return Drawer(
      child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 100.0,
          child: DrawerHeader(
            child: Text('Menu'),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.autorenew),
          title: const Text('Splash'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/splash');
          },
        ),
        ListTile(
          leading: const Icon(Icons.pan_tool),
          title: const Text('Buttons'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/buttons');
          },
        ),
        ListTile(
          leading: const Icon(Icons.text_fields),
          title: const Text('Text Fields'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/textfields');
          },
        ),
        ListTile(
          leading: const Icon(Icons.web),
          title: const Text('Other forms'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/forms');
          },
        ),
        ListTile(
          leading: const Icon(Icons.list),
          title: const Text('Icons'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/icons');
          },
        ),
        ListTile(
          leading: const Icon(Icons.trending_flat),
          title: const Text('Progress'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/progress');
          },
        ),
        ListTile(
          leading: const Icon(Icons.trending_flat),
          title: const Text('Figma'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/figma');
          },
        ),
      ],
    ));
  }
}
