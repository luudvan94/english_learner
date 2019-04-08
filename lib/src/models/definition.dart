import 'example.dart';

class Definition {

  final int _id;
  final String _defi;
  List<Example> exams = new List();

  Definition.fromJson(Map<String, dynamic> parsedJson) :
    _id =parsedJson['id'],
    _defi =parsedJson['defi'];
  
  Definition(this._id, this._defi);
}