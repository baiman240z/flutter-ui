import 'package:flutter/material.dart';
import 'parts/sidemenu.dart';
import 'package:http/http.dart' as http;

class IconList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icons'),
      ),
      body: _build(),
      drawer: SideMenu.drawer(context),
    );
  }

  Widget _build() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: FutureBuilder(
        future: http.get(
          "https://raw.githubusercontent.com/flutter/flutter/master/packages/flutter/lib/src/material/icons.dart"),
        builder: (context, AsyncSnapshot<http.Response> future) {
          if (!future.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          RegExp regexp = RegExp(
            r'>(.+?)<\/i>[\s\S]*?\sIconData\s([a-z_]+).+?IconData\(0x(.+?)\,',
            multiLine: true,
          );

          List<Map> icons = [];
          regexp.allMatches(future.data.body).forEach((match) {
            icons.add({
              "key": match.group(1),
              "codepoint": int.tryParse(match.group(3), radix: 16),
              "name": match.group(2),
            });
          });

          return Scrollbar(
            child: GridView.builder(
              itemCount: icons.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        child: Icon(
                          IconData(
                            icons[index]["codepoint"],
                            fontFamily: "MaterialIcons",
                          ),
                          size: 40,
                          color: Colors.teal,
                        ),
                        onPressed: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(icons[index]["name"]),
                          ));
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
