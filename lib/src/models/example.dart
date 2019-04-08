class Example {
  int _id;
  String _exam;

  Example.fromJson(Map<String, dynamic> parsedJson) :
    _id =parsedJson['id'],
    _exam =parsedJson['exam'];
  

  Example(this._id, this._exam);
}