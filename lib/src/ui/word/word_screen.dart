import 'package:flutter/material.dart';
import 'content.dart';
import '../../models/word.dart';
import '../../common/appearance.dart';
import '../../blocs/word_bloc.dart';
import '../../models/topic.dart';

class WordScreen extends StatefulWidget {

  WordScreen({this.topic}); 

  final Topic topic;

  @override
  State<StatefulWidget> createState() {
    return _WordScreenState();
  }
}

class _WordScreenState extends State<WordScreen> {

  var colorSets = [Appearance.darkSet1, Appearance.darkSet2];
  int currentIndex = 0;
  List<Word> wordList;

  _nextWord() {

    setState(() {
      currentIndex =currentIndex < wordList.length - 1 ? currentIndex + 1 : 0;
    });
  
  }

  _previousWord() {
    
    setState(() {
      currentIndex =currentIndex > 0 ? currentIndex - 1 :wordList.length - 1;
    });
  }

  Word get nextWord {
    return wordList[currentIndex + 1];
  }

  Word get currentWord {
    return wordList[currentIndex];
  }

  ColorSet get currentColorSet {
    return colorSets[currentIndex % 2];
  }

  ColorSet get nextColorSet {
    return colorSets[(currentIndex + 1) % 2];
  }


  @override
  Widget build(BuildContext context) {
    
    wordBloc.fetchWordList(widget.topic.id);
    return MaterialApp(
      home: StreamBuilder(
        stream: wordBloc.wordList,
        builder: (context, AsyncSnapshot<List<Word>> snapshot) {
          if (snapshot.hasData) {
            this.wordList =snapshot.data;

            return Stack(
                children: <Widget>[
                  WordContent(word: nextWord, colorSet: this.nextColorSet, nextWord: this._nextWord, previousWord: this._previousWord),
                  // WordContent(word: this.wordList[0])
                  WordContent(word: currentWord, colorSet: this.currentColorSet, nextWord: this._nextWord, previousWord: this._previousWord)
                  ], 
            );
          }
          
          return Center(child: CircularProgressIndicator());
        }
       )
    );
  }
}

