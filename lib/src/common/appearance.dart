import 'package:flutter/material.dart';

class Appearance {

  static final currentSet = new DartSet1();

  static final darkSet1 = new DartSet1();

}

class DartSet1 {

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

}