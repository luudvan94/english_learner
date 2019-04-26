import 'topic_api_provider.dart';
import '../models/topic.dart';

class TopicRepository {

  final topicApiProvider = new TopicApiProvider();

  Future<List<Topic>> fetchTopicList() => topicApiProvider.fetchTopicList();
}