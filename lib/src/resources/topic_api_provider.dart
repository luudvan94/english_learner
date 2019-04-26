import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/topic.dart';
import '../common/app_config.dart';

class TopicApiProvider {
  Client client = new Client();

  Future<List<Topic>> fetchTopicList() async {

    final response = await client.get("https://peaceful-anchorage-27502.herokuapp.com/topics");
    
    if (response.statusCode == 200) {
      var body =json.decode(response.body);
      List<Topic> topicList = [];
      for (var item in body) {
        topicList.add(Topic.fromJson(item));
      }
      return topicList;
    } else {
      throw Exception('Failed to load topic list');
    }
  }
}