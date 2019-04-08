import 'package:flutter/material.dart';
import 'appearance.dart';

class ElementStyle {

  static Text word(String data) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Appearance.currentSet.word,
        decoration: TextDecoration.none,
        fontFamily: 'Verdana'
      ),
    );
  }

  static Text pronounce(String data) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Appearance.currentSet.pronounce,
        decoration: TextDecoration.none,
        fontFamily: 'Verdana',
        fontSize: 15.0
      ),
    );
  }

  static Text example(String data, String keyword) {
    List<TextSpan> phrases = new List();
    List<String> datas = data.split(keyword);

    TextStyle normal = new TextStyle(
          color: Appearance.currentSet.example,
          decoration: TextDecoration.none,
          fontFamily: 'Monaco',
          fontSize: 14.0,
          fontWeight: FontWeight.w100
    );

    TextStyle highlight = new TextStyle(
          color: Appearance.currentSet.keyWord,
          fontWeight: FontWeight.bold,
          fontSize: 16.0
    );

    datas.asMap().forEach((i, value) {
      phrases.add(new TextSpan(text: value));

      if (i < datas.length - 1) {
        phrases.add(new TextSpan(text: keyword, style: highlight));
      }
    });

    return Text.rich(
      TextSpan(
        style:normal,
        children: phrases,
      )
    );
  }

  static Text definition(String data) {
    return Text(
      data,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Appearance.currentSet.definition,
        decoration: TextDecoration.none,
        fontFamily: 'Monaco',
        fontSize: 18.0,
      ),
    );
  }

  }