class Topic {

  static final TABLE_NAME = "topic";
  static final COLUMN_ID = "id";
  static final COLUMN_NAME = "name";

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COLUMN_ID: _id,
      COLUMN_NAME:_name,
    };

    return map;
  }

  Topic.fromMap(Map<String, dynamic> map) {
    _id = map[COLUMN_ID];
    _name =map[COLUMN_NAME];
  }

  int _id;
  String _name;

  Topic.fromJson(Map<String, dynamic> parsedJson) :
    _id =parsedJson['id'],
    _name =parsedJson['name'];
  

  Topic(this._id, this._name);

  String get name {
    return _name;
  }

  int get id {
    return this._id;
  }
}