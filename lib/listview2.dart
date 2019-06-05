import 'package:flutter/material.dart';

void main() => runApp(new MyApp(items: items,));

class MyApp extends StatelessWidget {

  final List<ListItem> items;

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

                 if (item is HeadingItem) {
                    return new ListTile(
                      title: new Text(item.heading,
                        style: Theme.of(context).textTheme.headline,
                      ),
                    );
                 } else if (item is MessageItem) {
                   return new ListTile(
                     title: new Text(item.message),
                     subtitle: new Text(item.message),
                   );
                 }


              }
          )));
  }
}

abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String message;

  MessageItem(this.message);
}

final items = new List<ListItem>.generate(1000, (index) {
  if (index % 6 == 0) {
    return new HeadingItem("Item $index");
  } else {
    return new MessageItem("Item $index");
  }
});
