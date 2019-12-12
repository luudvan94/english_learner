import 'package:flutter/material.dart';
import 'appearance.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ElementStyle {
  static Text word(String data) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Appearance.set1.word,
          decoration: TextDecoration.none,
          fontFamily: 'Verdana',
          fontSize: 35.0),
    );
  }

  static Text pronounce(String data) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Appearance.set1.pronounce,
          decoration: TextDecoration.none,
          fontFamily: 'Verdana',
          fontSize: 17.0),
    );
  }

  static Text type_word(String data) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Appearance.set1.pronounce,
          decoration: TextDecoration.none,
          fontFamily: 'Open Sans Condensed',
          fontWeight: FontWeight.bold,
          fontSize: 18.0),
    );
  }

  static Row example(String data, String keyword) {
    List<TextSpan> phrases = new List();
    List<String> datas = ("=> " + data).toLowerCase().split(keyword);

    TextStyle normal = new TextStyle(
      color: Appearance.set1.example,
      decoration: TextDecoration.none,
      fontFamily: 'Monaco',
      fontSize: 16.0,
      // fontWeight: FontWeight.w500
    );

    TextStyle highlight = new TextStyle(
        color: Appearance.set1.keyWord,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.bold,
        fontSize: 16.0);

    datas.asMap().forEach((i, value) {
      phrases.add(new TextSpan(text: value));

      if (i < datas.length - 1) {
        phrases.add(new TextSpan(text: keyword, style: highlight));
      }
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: AutoSizeText.rich(
          TextSpan(
            style: normal,
            children: phrases,
          ),
          maxLines: 5,
          textAlign: TextAlign.left,
        ))
      ],
    );
  }

  static Row definition(String data, bool sizeRestraint) {
    var max = sizeRestraint ? 3 : 10;
    var definition = data == "" ? "" : "- " + data;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: AutoSizeText(definition,
                maxLines: max,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Appearance.set1.definition,
                  decoration: TextDecoration.none,
                  fontFamily: 'Monaco',
                  fontSize: 18.0,
                )))
      ],
    );
  }

  static Text smallWord(String data) {
    return Text(data,
        style: TextStyle(
          color: Appearance.set1.word,
          decoration: TextDecoration.none,
          fontFamily: 'Monaco',
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ));
  }

  static Text smallTypeWord(String data) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Appearance.set1.pronounce,
          decoration: TextDecoration.none,
          fontFamily: 'Monaco',
          fontWeight: FontWeight.bold,
          fontSize: 16.0),
    );
  }

  static Text page(String currentPage, String totalPage) {
    TextStyle currentPageStyle = new TextStyle(
        color: Appearance.set1.currentPage,
        decoration: TextDecoration.none,
        fontFamily: 'Monaco',
        fontSize: 20.0,
        fontWeight: FontWeight.w100);

    TextStyle totalPageStyle = new TextStyle(
        color: Appearance.set1.totalPage,
        decoration: TextDecoration.none,
        fontFamily: 'Monaco',
        fontSize: 15.0,
        fontWeight: FontWeight.w100);

    return Text.rich(TextSpan(
        text: currentPage,
        style: currentPageStyle,
        children: <TextSpan>[
          TextSpan(text: " of " + totalPage, style: totalPageStyle)
        ]));
  }

  static Text topic(String topic) {
    return Text(
      topic,
      textAlign: TextAlign.left,
      style: TextStyle(
          color: Appearance.set1.topic,
          decoration: TextDecoration.none,
          fontFamily: 'Monaco',
          fontWeight: FontWeight.bold,
          fontSize: 25.0),
    );
  }

  static Text topicDescription(String description) {
    return Text(
      description,
      textAlign: TextAlign.left,
      style: TextStyle(
          color: Appearance.set1.description,
          decoration: TextDecoration.none,
          fontFamily: 'Monaco',
          fontSize: 18.0,
          fontWeight: FontWeight.w100),
    );
  }

  static Text openTitle(key) {
    return Text(
      "open",
      key: Key(key),
      textAlign: TextAlign.left,
      style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.none,
          fontFamily: 'Monaco',
          fontSize: 15.0,
          fontWeight: FontWeight.w100),
    );
  }

  static Text topicListTitle() {
    return Text(
      "topic list",
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Appearance.set1.topicListTitle,
          decoration: TextDecoration.none,
          fontFamily: 'Monaco',
          fontSize: 35.0,
          fontWeight: FontWeight.bold),
    );
  }
}
