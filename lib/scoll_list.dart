import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = "Horizontal list";

    return new MaterialApp(
        title: title,
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text(title),
          ),
          body: new Container(
            margin: new EdgeInsets.symmetric(vertical: 20),
            height: 200,
            child: new ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                new Container(
                  width: 160,
                  color: Colors.red,
                ),
                new Container(
                  width: 160,
                  color: Colors.blue,
                ),
                new Container(
                  width: 160,
                  color: Colors.green,
                ),
                new Container(
                  width: 160,
                  color: Colors.yellow,
                ),
                new Container(
                  width: 160,
                  color: Colors.orange,
                ),
              ],

            ),
          ),
        )
    );
  }
}