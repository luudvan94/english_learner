import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/word.dart';
import '../common/app_config.dart';

class WordApiProvider {
  Client _client;

  WordApiProvider(Client client) {
    this._client =client;
  }

  WordApiProvider.defaultProvider() {
    this._client = new Client();
  }

  Future<List<Word>> fetchWordList(int topicId) async {

    final response = await _client.get("https://peaceful-anchorage-27502.herokuapp.com/topic/" + topicId.toString());
    
    if (response.statusCode == 200) {
      var body =json.decode(response.body);
      List<Word> wordList = [];
      for (var item in body) {
        wordList.add(Word.fromJson(item));
      }
      return wordList;
    } else {
      throw Exception('Failed to load word list');
    }
  }
}