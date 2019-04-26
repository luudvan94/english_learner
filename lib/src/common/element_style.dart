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
        fontFamily: 'Railway',
        fontSize: 15.0
      ),
    );
  }

  static Text type_word(String data) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Appearance.currentSet.pronounce,
        decoration: TextDecoration.none,
        fontFamily: 'Open Sans Condensed',
        fontWeight: FontWeight.bold,
        fontSize: 16.0
      ),
    );
  }

  static Text example(String data, String keyword) {
    List<TextSpan> phrases = new List();
    List<String> datas = ("= " + data).toLowerCase().split(keyword);

    TextStyle normal = new TextStyle(
          color: Appearance.currentSet.example,
          decoration: TextDecoration.none,
          fontFamily: 'Open Sans Condensed',
          fontSize: 14.0,
          fontWeight: FontWeight.w100
    );

    TextStyle highlight = new TextStyle(
          color: Appearance.currentSet.keyWord,
          fontWeight: FontWeight.bold,
          fontSize: 16.0
    );

    // if (data.toLowerCase().startsWith(keyword.toLowerCase())) {
    //   phrases.add(new TextSpan(text: keyword, style: highlight));
    // }

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
      "- " + data,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Appearance.currentSet.definition,
        decoration: TextDecoration.none,
        fontFamily: 'Monaco',
        fontSize: 18.0,
      ),
    );
  }

  static Text smallWord(String data) {
    return Text(
      data,
      style: TextStyle(
          color: Appearance.currentSet.word,
          decoration: TextDecoration.none,
          fontFamily: 'Open Sans Condensed',
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
      )
    );
  }

  static Text smallTypeWord(String data) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Appearance.currentSet.pronounce,
        decoration: TextDecoration.none,
        fontFamily: 'Open Sans Condensed',
        fontWeight: FontWeight.bold,
        fontSize: 14.0
      ),
    );
  }

  static Text page(String currentPage, String totalPage) {
    TextStyle currentPageStyle = new TextStyle(
          color: Appearance.currentSet.currentPage,
          decoration: TextDecoration.none,
          fontFamily: 'Open Sans Condensed',
          fontSize: 20.0,
          fontWeight: FontWeight.w100
    );

    TextStyle totalPageStyle = new TextStyle(
          color: Appearance.currentSet.totalPage,
          decoration: TextDecoration.none,
          fontFamily: 'Open Sans Condensed',
          fontSize: 15.0,
          fontWeight: FontWeight.w100
    );

    return Text.rich(
      TextSpan(
        text: currentPage,
        style: currentPageStyle,
        children: <TextSpan> [
          TextSpan(
            text:  " of " + totalPage,
            style: totalPageStyle
          )
        ]
      )
    );
  }

  static Text topic(String topic) {
    return Text(
      topic,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Appearance.currentSet.topic,
        decoration: TextDecoration.none,
        fontFamily: 'Open Sans Condensed',
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),
    );
  }

  static Text topicDescription(String description) {
    return Text(
      description,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Appearance.currentSet.description,
          decoration: TextDecoration.none,
          fontFamily: 'Monaco',
          fontSize: 14.0,
          fontWeight: FontWeight.w100
      ),
    );
  }

  static Text topicListTitle() {
    return Text(
      "Topic List",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Appearance.currentSet.topicListTitle,
          decoration: TextDecoration.none,
          fontFamily: 'Monaco',
          fontSize: 35.0,
          fontWeight: FontWeight.bold
      ),
    );
  }
}