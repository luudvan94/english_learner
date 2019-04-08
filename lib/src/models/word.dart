import 'definition.dart';
import 'example.dart';
import 'topic.dart';
import 'dart:convert';

class Word {
  int _id;
  String _name;
  String _type_word;
  String _pronounce;
  String _audio_link;
  String _link;
  Topic _topic;
  List<Definition> _definitions = [];

  Word.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _name =parsedJson['name'];
    _type_word =parsedJson['typeWord'];
    _pronounce =parsedJson['pronounce'];
    _audio_link =parsedJson['audioLink'];
    _link =parsedJson['link'];
    _topic =Topic.fromJson(parsedJson['topic']);

    List<Definition> temp = [];
    for (int i = 0; i < parsedJson['definitions'].length; i++) {
      var definitionJson = parsedJson['definitions'][i];
      Definition definition = Definition.fromJson(definitionJson);

      for (int j = 0; j > definitionJson['examples'].length; j++) {
        definition.exams.add(Example.fromJson(definitionJson['examples']));
      }
      
      temp.add(definition);
    }
  }
}