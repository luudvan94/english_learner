class Example {

  static final TABLE_WORD = "example";
  static final COLUMN_ID = "id";
  static final COLUMN_EXAM = "exam";
  static final COLUMN_DEFI_ID = "defi_id";

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COLUMN_ID: _id,
      COLUMN_EXAM:_exam,
      COLUMN_DEFI_ID:_definitionId,
    };

    return map;
  }

  Example.fromMap(Map<String, dynamic> map) {
    _id = map[COLUMN_ID];
    _exam =map[COLUMN_EXAM];
    _definitionId =map[COLUMN_DEFI_ID];
  }

  int _id;
  String _exam;

  int _definitionId;


  Example.fromJson(Map<String, dynamic> parsedJson) :
    _id =parsedJson['id'],
    _exam =parsedJson['exam'];
  

  Example(this._id, this._exam);

  set definitionId(int id) {
    this._definitionId = id;
  }

  int get id {
    return this._id;
  }

  int get definitionId {
    return this._definitionId;
  }
}