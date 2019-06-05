import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = "Web Images";

    return new MaterialApp(
        title: title,
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text(title),
          ),
          body: new Center(child: new MyButton(),)
    ),);
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        final snackBar = new SnackBar(content: new Text("Tap"));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: new Container(
        padding: new EdgeInsets.all(12.0),
        decoration: new BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: new BorderRadius.circular(8.0)
        ),
        child: new Text("MyButton"),
      ),
    );
  }
}

