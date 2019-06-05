import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  var title = 'fadeinimage';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: 'http://a.hiphotos.baidu.com/image/pic/item/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg'),
      ),
    );
  }
}
