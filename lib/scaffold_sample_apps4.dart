
import 'package:flutter/material.dart';

void main() {
  runApp(ExpansionTileSample());

}

class ExpansionTileSample extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ExpansionTileSample();
  }
}

class _ExpansionTileSample extends State<ExpansionTileSample> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text("ExpansionTile"),
        ),
        body: new ListView.builder(
          itemBuilder: (BuildContext context, int index) => new EntryItem(data[index]),
          itemCount: data.length,
        ),
      ),
    );
  }
}

class Entry {
  final String title;
  final List<Entry> children;
  Entry(this.title, [this.children = const <Entry>[]]);
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  new Entry('Chapter A',
    <Entry>[
      new Entry('Section A0',
        <Entry>[
          new Entry('Item A0.1'),
          new Entry('Item A0.2'),
          new Entry('Item A0.3'),
        ],
      ),
      new Entry('Section A1'),
      new Entry('Section A2'),
    ],
  ),
  new Entry('Chapter B',
    <Entry>[
      new Entry('Section B0'),
      new Entry('Section B1'),
    ],
  ),
  new Entry('Chapter C',
    <Entry>[
      new Entry('Section C0'),
      new Entry('Section C1'),
      new Entry('Section C2',
        <Entry>[
          new Entry('Item C2.0'),
          new Entry('Item C2.1'),
          new Entry('Item C2.2'),
          new Entry('Item C2.3'),
        ],
      ),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;


  Widget _buildTiles(Entry entry) {
    if(entry.children.isEmpty) {
      return new ListTile(title: Text(entry.title));
    } else {
      return new ExpansionTile(
        key: new PageStorageKey<Entry>(entry),
        title: new Text(entry.title),
        children: entry.children.map(_buildTiles).toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }

}

