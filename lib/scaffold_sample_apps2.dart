import 'package:flutter/material.dart';

void main() {
  runApp(new AppBarBottomSample());
}

class AppBarBottomSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AppBarBottomSample();
  }
}

class _AppBarBottomSample extends State<AppBarBottomSample>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: choices.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;
    if (newIndex < 0 || newIndex >= _tabController.length) {
      return;
    }
    _tabController.animateTo(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: new Text("AppBar Bottom Widget"),
          centerTitle: true,
          leading: new IconButton(
            tooltip: "Previous choice",
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              _nextPage(-1);
            },
          ),
          actions: <Widget>[
            new IconButton(
                icon: Icon(Icons.arrow_forward),
                tooltip: "Next choice",
                onPressed: () {
                  _nextPage(1);
                })
          ],
          bottom: new PreferredSize(
              child: new Theme(
                  data: Theme.of(context).copyWith(accentColor: Colors.white),
                  child: new Container(
                    height: 48.0,
                    alignment: Alignment.center,
                    child: new TabPageSelector(
                      controller: _tabController,
                    ),
                  )),
              preferredSize: Size.fromHeight(48.0)),
        ),
        body: new TabBarView(
          controller: _tabController,
            children: choices.map((Choice choice) {
          return new Padding(
            padding: new EdgeInsets.all(16),
            child: new ChoiceCard(choice: choice),
          );
        }).toList()),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
