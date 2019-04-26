import 'package:flutter/material.dart';
import 'ui/word/word_screen.dart';
import 'blocs/word_bloc.dart';
import 'blocs/topic_bloc.dart';
import 'models/word.dart';
import 'models/topic.dart';
import './ui/topic/topic_screen.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return TopicScreen();
  }
}