import 'package:flutter/material.dart';

class Appearance {

  static final currentSet = new DartSet1();

  static final darkSet1 = new DartSet1();

  static final darkSet2 = new DartSet2();

  static final lightSet1 = new LightSet1();

  static final lightSet2 = new LightSet2();

  static ColorSet get set1 {
    // var currentTime =DateTime.now();
    // debugPrint(currentTime.hour.toString());
    // if (currentTime.hour < 18) {
    //   return lightSet1;
    // } 

    return darkSet1;
  }

  static ColorSet get set2 {
    // var currentTime =DateTime.now();
    // if (currentTime.hour < 18) {
    //   return lightSet2;
    // } 

    return darkSet2;
  }

}

class ColorSet {
  Color get pronounce {
  }

  Color get word {
  }

  Color get definition {
  }

  Color get example {
  }

  Color get keyWord {
  }

  Color get background {
  }

  Color get typeWord {
  }

  Color get totalPage {
  }

  Color get currentPage {
  }

  Color get topic {
  }

  Color get description {
  }

  Color get topicListTitle {
  }

  Color get getButton {
  }

  Color get openButton {
  }

}

class DartSet1 implements ColorSet{

  Color get pronounce {
    return Color.fromRGBO(201, 21, 111, 1);
  }

  Color get word {
    return Colors.white;
  }

  Color get definition {
    return Color.fromRGBO(114, 140, 0, 1);
  }

  Color get example {
    return Colors.white;
  }

  Color get keyWord {
    return Color.fromRGBO(23, 100, 172, 1);
  }

  Color get background {
    return Color.fromRGBO(0, 43, 54, 1);
    // return Colors.black;
  }

  Color get typeWord {
    return Color.fromRGBO(201, 21, 111, 1);
  }

  Color get totalPage {
    return Color.fromRGBO(57, 83, 89, 1);
  }

  Color get currentPage {
    return Colors.white;
  }

  Color get topic {
    return pronounce;
  }

  Color get description {
    return definition;
  }

  Color get topicListTitle {
    return word;
  }

  Color get getButton {
    return keyWord;
  }

  Color get openButton {
    return pronounce;
  }

}

class DartSet2 implements ColorSet {
  Color get pronounce {
    return Color.fromRGBO(24, 64, 117, 1);
  }

  Color get word {
    return Colors.white;
  }

  Color get definition {
    return Color.fromRGBO(145, 125, 90, 1);
  }

  Color get example {
    return word;
  }

  Color get keyWord {
    return Color.fromRGBO(122, 69, 158, 1);
  }

  Color get background {
    // return Color.fromRGBO(0, 25, 33, 1);
    return Color.fromRGBO(0, 11, 19, 1);
    // return Colors.black;
  }

  Color get typeWord {
    return Color.fromRGBO(25, 65, 118, 1);
  }

  Color get totalPage {
    return Color.fromRGBO(194, 162, 110, 1);
  }

  Color get currentPage {
    return word;
  }

  Color get topic {
    return pronounce;
  }

  Color get description {
    return definition;
  }

  Color get topicListTitle {
    return word;
  }

  Color get getButton {
    return keyWord;
  }

  Color get openButton {
    return pronounce;
  }
}

class LightSet1 implements ColorSet{

  Color get background {
    return Color.fromRGBO(253, 245, 219, 1);
  }

  Color get pronounce {
    return Color.fromRGBO(114, 140, 0, 1);
  }

  Color get word {
    return Color.fromRGBO(46, 47, 46, 1);
  }

  Color get definition {
    return Color.fromRGBO(38, 131, 205, 1);
  }

  Color get example {
    return word;
  }

  Color get keyWord {
    return Color.fromRGBO(207, 47, 124, 1);
  }

  Color get typeWord {
    return Color.fromRGBO(132, 154, 6, 1);
  }

  Color get totalPage {
    return Color.fromRGBO(91, 90, 88, 1);
  }

  Color get currentPage {
    return word;
  }

  Color get topic {
    return pronounce;
  }

  Color get description {
    return definition;
  }

  Color get topicListTitle {
    return word;
  }

  Color get getButton {
    return keyWord;
  }

  Color get openButton {
    return pronounce;
  }

}

class LightSet2 implements ColorSet {
  Color get pronounce {
    return Color.fromRGBO(154, 36, 34, 1);
  }

  Color get word {
    return Color.fromARGB(51, 51, 51, 1);
  }

  Color get definition {
    return Color.fromRGBO(58, 78, 189, 1);
  }

  Color get example {
    return word;
  }

  Color get keyWord {
    return Color.fromRGBO(102, 35, 142, 1);
  }

  Color get background {
    return Color.fromRGBO(242, 242, 242, 1);
  }

  Color get typeWord {
    return Color.fromRGBO(138, 117, 169, 1);
  }

  Color get totalPage {
    return Color.fromRGBO(72, 79, 64, 1);
  }

  Color get currentPage {
    return word;
  }

  Color get topic {
    return pronounce;
  }

  Color get description {
    return definition;
  }

  Color get topicListTitle {
    return word;
  }

  Color get getButton {
    return keyWord;
  }

  Color get openButton {
    return pronounce;
  }
}