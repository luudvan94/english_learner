// import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/topic.dart';
import '../resources/topic_repository.dart';

class TopicBloc {
  final _repository =TopicRepository();
  final _topicFetcher =PublishSubject<List<Topic>>();

  Observable<List<Topic>> get topicList => _topicFetcher.stream;

  fetchTopicList() async {
    List<Topic> topicList = await _repository.fetchTopicList();
    _topicFetcher.sink.add(topicList);
  }

  dispose() {
    _topicFetcher.close();
  }
  
}

final topicBloc =TopicBloc();