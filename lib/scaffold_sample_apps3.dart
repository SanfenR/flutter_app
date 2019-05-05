import 'package:flutter/material.dart';

void main() {
  runApp(new AnimatedListSample());
}

class AnimatedListSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AnimatedListSample();
  }
}

class _AnimatedListSample extends State<AnimatedListSample> {
  final GlobalKey<AnimatedListState> _listKey = new GlobalKey();
  ListModel<int> _list;
  int _selectedItem;
  int _nextItem;

  Widget _buildRemovedItem(
      int item, BuildContext context, Animation<double> animation) {
    return new CardItem(
      animation: animation,
      item: item,
      selected: false,
    );
  }

  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return new CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  // Insert the "next item" into the list model.
  void _insert() {
    final int index = _selectedItem == null ? _list.length : _list.indexOf(_selectedItem);
    _list.insert(index, _nextItem++);
  }

  // Remove the selected item from the list model.
  void _remove() {
    if (_selectedItem != null) {
      _list.removeAt(_list.indexOf(_selectedItem));
      setState(() {
        _selectedItem = null;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _list = new ListModel(
        listKey: _listKey,
        removedItemBuilder: _buildRemovedItem,
        initialItems: <int>[0, 1, 2, 3]);

    _nextItem = 4;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text("AnimatedList"),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.add_circle),
              onPressed: _insert,
              tooltip: "insert a new item",
            ),
            new IconButton(
                icon: Icon(Icons.remove_circle),
                tooltip: "remove this selected item",
                onPressed: _remove)
          ],
        ),
        body: new Padding(
          padding: EdgeInsets.all(16.0),
          child: new AnimatedList(
            itemBuilder: _buildItem,
            key: _listKey,
            initialItemCount: _list.length,
          ),
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem(
      {Key key, this.animation, this.onTap, this.item, this.selected})
      : assert(animation != null),
        super(key: key);
  final Animation<double> animation;
  final VoidCallback onTap;
  final int item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected) {
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    }
    return new Padding(
      padding: EdgeInsets.all(2.0),
      child: new SizeTransition(
        sizeFactor: animation,
        axis: Axis.vertical,
        child: new GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: new SizedBox(
            height: 128.0,
            child: new Card(
              color: Colors.primaries[item % Colors.primaries.length],
              child: new Center(
                child: new Text("item $item", style: textStyle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListModel<E> {
  ListModel({
    @required this.listKey,
    @required this.removedItemBuilder,
    Iterable<E> initialItems,
  })  : assert(listKey != null),
        assert(removedItemBuilder != null),
        _items = new List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<E> _items;

  AnimatedListState get _animatedList => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList.insertItem(index);
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList.removeItem(index,
          (BuildContext context, Animation<double> animation) {
        return removedItemBuilder(removedItem, context, animation);
      });
    }
    return removedItem;
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}
