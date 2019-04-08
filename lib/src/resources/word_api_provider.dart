import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/word.dart';
import '../common/app_config.dart';

class WordApiProvider {
  Client client = new Client();

  Future<Word> fetchWordList(Client client) async {

    final response = await client.get(AppConfig.API_URL);

    if (response.statusCode == 200) {
      print(response.body);
      return Word.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load word list');
    }
  }
}