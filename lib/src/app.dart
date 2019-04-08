import 'package:flutter/material.dart';
import 'ui/word/word_screen.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WordScreen(),
      theme: ThemeData(fontFamily: 'Monaco'),
    );
  }
}