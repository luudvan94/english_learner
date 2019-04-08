class Topic {
  int _id;
  String _name;

  Topic.fromJson(Map<String, dynamic> parsedJson) :
    _id =parsedJson['id'],
    _name =parsedJson['name'];
  

  Topic(this._id, this._name);
}