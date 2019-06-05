import 'package:flutter/material.dart';

void main() => runApp(new MyApp(items: items,));

class MyApp extends StatelessWidget {
  final List<String> items;

  const MyApp({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = "Web Images";

    return new MaterialApp(
        title: title,
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text(title),
            ),
            body: new ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return new Dismissible(
                      key: new Key(item),
                      child: new ListTile(title: new Text(item),),
                    onDismissed: (direction) {
                        items.removeAt(index);
                        Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(item)));
                    },
                  );


                })));
  }
}

final items = new List<String>.generate(100, (index) => "Item $index");
