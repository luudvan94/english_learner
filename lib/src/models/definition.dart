import 'example.dart';

class Definition {

  static final TABLE_WORD = "definition";
  static final COLUMN_ID = "id";
  static final COLUMN_DEFI = "defi";
  static final COLUMN_WORD_ID = "word_id";

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COLUMN_ID: _id,
      COLUMN_DEFI:_defi,
      COLUMN_WORD_ID:_wordId,
    };

    return map;
  }

  Definition.fromMap(Map<String, dynamic> map) {
    _id = map[COLUMN_ID];
    _defi =map[COLUMN_DEFI];
    _wordId =map[COLUMN_WORD_ID];
  }

  int _id;
  String _defi;
  List<Example> _exams = new List();

  int _wordId;

  Definition.fromJson(Map<String, dynamic> parsedJson) :
    _id =parsedJson['id'],
    _defi =parsedJson['defi'];
  
  Definition(this._id, this._defi);

  set wordId(int id) {
    this._wordId = id;
  }

  int get id {
    return this._id;
  }

  int get wordId {
    return this._wordId;
  }

  List<Example> get examples {
    return this._exams;
  }

  set examples(List<Example> examples) {
    this._exams =examples;
  }
}