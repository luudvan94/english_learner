import 'package:flutter/material.dart';
import 'content.dart';
import '../../models/word.dart';
import '../../common/appearance.dart';
import '../../blocs/word_bloc.dart';
import '../../models/topic.dart';
import 'package:audioplayers/audioplayers.dart';
import 'content_loading.dart';
import 'package:flutter/services.dart';

class WordScreen extends StatefulWidget {

  WordScreen({this.topic}); 

  final Topic topic;

  @override
  State<StatefulWidget> createState() {
    return _WordScreenState();
  }
}

class _WordScreenState extends State<WordScreen> with TickerProviderStateMixin{

  var colorSets = [Appearance.set1, Appearance.set2];
  int currentIndex = 0;
  bool playSoundEffect = false;
  bool animateForth = true;
  bool playable = true;
  List<Word> wordList;
  AudioPlayer _audioPlayer;

  //ANIMATION
  AnimationController _controller;
  Animation<double> _animation;
  Animation<double> _animationBack;
  Animation _curve;

  @override
  void initState() {
    super.initState();

    _audioPlayer = new AudioPlayer();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    
    _animation = Tween<double>(
      begin: 0.0,
      end: 0.5,
    ).animate(_curve);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

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
    setState(() {
      playSoundEffect = true;
    });

    _animation.addStatusListener((status) {
      if (status ==AnimationStatus.dismissed) {
        setState(() {
          playSoundEffect = false;
        });
      }

      if (status ==AnimationStatus.completed) {
        _controller.reverse();
        animateForth = false;
      }  
    });

    _animation.addListener(() {
      setState(() {
        // trigger rebuild 
      });
    });

    _controller.forward();
    stop();
    play("https://tranquil-meadow-54862.herokuapp.com/play/audio/learner-dic/" + currentWord.audioLink);
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

            if (this.wordList == null) {
              this.wordList =snapshot.data;
              this.wordList.shuffle();  
            }
        

            if (playable) {
              playable =false;
              play("https://tranquil-meadow-54862.herokuapp.com/play/audio/learner-dic/" + currentWord.audioLink);
            }

            if (playSoundEffect) {
              return Stack(
                children: <Widget>[
                  WordContent(word: nextWord, colorSet: this.nextColorSet, nextWord: this._nextWord, previousWord: this._previousWord),
                  // WordContent(word: this.wordList[0])
                  WordContent(word: currentWord, colorSet: this.currentColorSet, nextWord: this._nextWord, previousWord: this._previousWord, playSound: this.playCallback),
                  Opacity(
                    opacity: _animation.value,
                    child: Container(color: nextColorSet.background),
                  )
                  ], 
            );
            } else {
              return Stack(
                children: <Widget>[
                  WordContent(word: nextWord, colorSet: this.nextColorSet, nextWord: this._nextWord, previousWord: this._previousWord),
                  // WordContent(word: this.wordList[0])
                  WordContent(word: currentWord, colorSet: this.currentColorSet, nextWord: this._nextWord, previousWord: this._previousWord, playSound: this.playCallback)
                  ], 
            );
            }
            
          }
          
          return ContentLoading();
        }
       )
    );
  }
}

