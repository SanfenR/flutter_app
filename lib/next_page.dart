import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {

  String title = "Next Page";

  @override
  State<StatefulWidget> createState() => _NextHomePageState();

}

class _NextHomePageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}