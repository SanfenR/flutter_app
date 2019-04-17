import 'package:flutter/material.dart';

void main() {
  runApp(_Row1());
}



class _TestContainer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        color: new Color(0xFF00FF00),
        width: 48,
        height: 48,
      ),
    );
  }
}


class _TestContainer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Container(
        constraints: new BoxConstraints.expand(
          height:Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
        ),
        decoration: new BoxDecoration(
          border: new Border.all(width: 2.0, color: Colors.red),
          color: Colors.grey,
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
          image: new DecorationImage(
            image: new NetworkImage('http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
            centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        child: new Text('Hello World',
            textDirection: TextDirection.ltr,
            style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black)),
        transform: new Matrix4.rotationZ(0.3),
      ),
    );
  }
}

class _Row1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Row(
        children: <Widget>[
          Expanded(
            child: Text('Deliver features faster', textAlign: TextAlign.center),
          ),
          Expanded(
            child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain, // otherwise the logo will be tiny
              child: const FlutterLogo(),
            ),
          ),
        ],
      ),
    );
  }

}



