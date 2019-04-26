import 'package:flutter/material.dart';
import 'content.dart';
import '../../models/word.dart';
import '../../common/appearance.dart';
import '../../blocs/word_bloc.dart';
import '../../models/topic.dart';
import 'package:audioplayers/audioplayers.dart';

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
  bool playable = true;
  List<Word> wordList;
  AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();

    _audioPlayer = new AudioPlayer();

    // play("http://english-learner-data-preparation-vl4298.c9users.io/play/audio/learner-dic/beard001.mp3");
  }

  _nextWord() {
    // stop();
    setState(() {
      playable = true;
      currentIndex =currentIndex < wordList.length - 1 ? currentIndex + 1 : 0;
    });
  
  }

  _previousWord() {
    // stop();
    setState(() {
      playable = true;
      currentIndex =currentIndex > 0 ? currentIndex - 1 :wordList.length - 1;
    });
  }

  Future<int> play(String url) async {
    debugPrint(url);
    final result =await _audioPlayer.play(url, isLocal: false);

    return result;
  }

  playCallback() {
    stop();
    play("https://english-learner-data-preparation-vl4298.c9users.io/play/audio/learner-dic/" + currentWord.audioLink);
  }

  Future<int> stop() async {
    final result =await _audioPlayer.stop();
    
    return result;
  }
  Word get nextWord {
    if (currentIndex ==wordList.length - 1) {
      return wordList[0];
    }

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

            if (playable) {
              playable =false;
              playCallback();
            }
            

            return Stack(
                children: <Widget>[
                  WordContent(word: nextWord, colorSet: this.nextColorSet, nextWord: this._nextWord, previousWord: this._previousWord),
                  // WordContent(word: this.wordList[0])
                  WordContent(word: currentWord, colorSet: this.currentColorSet, nextWord: this._nextWord, previousWord: this._previousWord, playSound: this.playCallback)
                  ], 
            );
          }
          
          return Center(child: CircularProgressIndicator());
        }
       )
    );
  }
}

