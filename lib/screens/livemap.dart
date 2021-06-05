import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//ignore: must_be_immutable
class MapsScreen extends StatefulWidget {
  final imgPath;
  final Color color;

  MapsScreen({this.color, this.imgPath});

  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final String url = 'https://www.bing.com/covid';

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text('Live Map'),
        backgroundColor: Colors.tealAccent,
        foregroundColor: Colors.blueGrey,
      ),
      url: url,
      withZoom: true,
      withLocalStorage: true,
    );
  }
}
