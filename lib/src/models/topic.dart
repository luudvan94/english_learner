class Topic {

  static final TABLE_NAME = "topic";
  static final COLUMN_ID = "id";
  static final COLUMN_NAME = "name";
  static final COLUMN_DESCRIPTION = "description";
  static final COLUMN_IS_DOWNLOADED = "isDownloaded";

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COLUMN_ID: _id,
      COLUMN_NAME:_name,
      COLUMN_DESCRIPTION:_description
    };

    return map;
  }

  Topic.fromMap(Map<String, dynamic> map) {
    _id = map[COLUMN_ID];
    _name =map[COLUMN_NAME];
    _description =map[COLUMN_DESCRIPTION];
    _isDownloaded =map[COLUMN_IS_DOWNLOADED];
  }

  int _id;
  String _name;
  String _description;
  int _isDownloaded;

  Topic.fromJson(Map<String, dynamic> parsedJson) :
    _id =parsedJson['id'],
    _name =parsedJson['name'],
    _description = parsedJson['description'];
  

  Topic(this._id, this._name, this._description);

  String get name {
    return _name;
  }

  String get description {
    return _description;
  }

  int get id {
    return this._id;
  }

  bool get isDownloaded {
    return this._isDownloaded == 1 ? true : false;
  }
}