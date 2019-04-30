
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Code Sample for material.RaisedButton",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyStatelessWidget(),
    );
  }

}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RaisedButton(
            onPressed: null,
            child: const Text("Disabled Button"),
          ),
          RaisedButton (
            onPressed: (){},
            child: const Text("Enabled Button"),
          ),
          RaisedButton (
            onPressed: () {},
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Colors.red, Colors.green, Colors.blue],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Text('Gradient Button'),
            ),
          )

        ],
      ),

    );
  }


}

