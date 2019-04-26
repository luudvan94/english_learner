import 'package:flutter/material.dart';

class Appearance {

  static final currentSet = new DartSet1();

  static final darkSet1 = new DartSet1();

  static final darkSet2 = new DartSet2();

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
    return example;
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
    return Color.fromRGBO(0, 25, 33, 1);
  }

  Color get typeWord {
    return Color.fromRGBO(201, 21, 111, 1);
  }

  Color get totalPage {
    return Color.fromRGBO(72, 79, 64, 1);
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
    return example;
  }

  Color get getButton {
    return keyWord;
  }

  Color get openButton {
    return pronounce;
  }
}