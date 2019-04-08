import 'package:flutter/material.dart';
import 'content.dart';

class WordScreen extends StatefulWidget {
  WordScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WordScreenState();
  }

}

class _WordScreenState extends State<WordScreen> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          WordContent()
          ], 
    );     
  }
}

