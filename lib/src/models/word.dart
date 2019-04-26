import 'definition.dart';
import 'example.dart';
import 'topic.dart';
import 'dart:convert';

class Word {

  static final TABLE_NAME = "word";
  static final COLUMN_ID = "id";
  static final COLUMN_NAME = "name";
  static final COLUMN_TYPE_WORD = "type_word";
  static final COLUMN_PRONOUNCE = "pronounce";
  static final COLUMN_AUDIO_LINK = "audio_link";
  // static final COLUMN_IMAGE_LINK = "image_link";
  static final COLUMN_LINK = "link";
  static final COLUMN_TOPIC_ID = "topic_id";

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COLUMN_ID: _id,
      COLUMN_NAME:_name,
      COLUMN_TYPE_WORD:_type_word,
      COLUMN_PRONOUNCE:_pronounce,
      COLUMN_AUDIO_LINK:_audio_link,
      // COLUMN_IMAGE_LINK:_image_link,
      COLUMN_LINK:_link,
      COLUMN_TOPIC_ID:_topic.id,
    };

    return map;
  }

  Word.fromMap(Map<String, dynamic> map) {
    _id = map[COLUMN_ID];
    _name =map[COLUMN_NAME];
    _type_word =map[COLUMN_TYPE_WORD];
    _pronounce =map[COLUMN_PRONOUNCE];
    _audio_link =map[COLUMN_AUDIO_LINK];
    // _image_link =map[COLUMN_IMAGE_LINK];
    _link =map[COLUMN_LINK];
  }

  int _id;
  String _name;
  String _type_word;
  String _pronounce;
  String _audio_link;
  String _image_link;
  String _link;
  Topic _topic;
  List<Definition> _definitions = new List();

  Word.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _name =parsedJson['name'];
    _type_word =parsedJson['typeWord'];
    _pronounce =parsedJson['pronounce'];
    _audio_link =parsedJson['audioLink'];
    // _image_link =parsedJson['imageLink'];
    _link =parsedJson['link'];
    _topic =Topic.fromJson(parsedJson['topic']);

    List<Definition> temp = new List();
    for (int i = 0; i < parsedJson['definitions'].length; i++) {
      var definitionJson = parsedJson['definitions'][i];
      Definition definition = Definition.fromJson(definitionJson);
      definition.wordId = this._id;

      List<Example> temp1 = new List();
      for (int j = 0; j < definitionJson['examples'].length; j++) {
        var exam = Example.fromJson(definitionJson['examples'][j]);
        exam.definitionId =definition.id;
        temp1.add(exam);
      }
      
      definition.examples = temp1;
      temp.add(definition);
    }

    _definitions =temp;
  }

  Word() {}

  int get id {
    return _id;
  }

  String get name {
    return _name;
  }

  String get typeWord {
    return _type_word;
  }

  String get pronounce {
    return _pronounce;
  }

  String get topic {
    return _topic.name;
  }

  String get audioLink {
    return _audio_link;
  }

  String get imageLink {
    return _image_link;
  }

  List<Definition> get definitions {
    return this._definitions;
  }

  set definitions(List<Definition> definitions) {
    this._definitions = definitions;
  }

}