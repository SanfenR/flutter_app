import 'package:flutter/material.dart';

void main() {
  runApp(new BasicAppBarSample());
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

class BasicAppBarSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _BasicAppBarSampleState();
  }
}

class _BasicAppBarSampleState extends State<BasicAppBarSample> {
  Choice _selectedChoice = choices[0];

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text("Basic AppBar"),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(choices[0].icon),
                onPressed: () {
                  _select(choices[0]);
                }),
            new IconButton(
                icon: Icon(choices[1].icon),
                onPressed: () {
                  _select(choices[1]);
                }),
            new PopupMenuButton<Choice>(
                onSelected: _select,
                itemBuilder: (BuildContext context) {
                  return choices.skip(2).map((Choice choice) {
                    return new PopupMenuItem<Choice>(
                      value: choice,
                      child: new Text(choice.title),
                    );
                  }).toList();
                })
          ],
        ),
        body: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new ChoiceCard(choice: _selectedChoice),
        ),
      ),
      routes: <String, WidgetBuilder> {
//        "/router/second": (_) => new
      },

    );
  }
}

class ChoiceCard extends StatelessWidget {
  ChoiceCard({Key key, this.choice}) : super(key: key);
  final Choice choice;
  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128, color: style.color,),
            Text(choice.title, style: style,)
          ],
        ),
      ),
    );
  }
}
