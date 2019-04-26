// import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/word.dart';
import '../resources/word_repository.dart';

class WordBloc {
  final _repository =WordRepository();
  final _wordFetcher =PublishSubject<List<Word>>();

  Observable<List<Word>> get wordList => _wordFetcher.stream;

  fetchWordList(int topicId) async {
    List<Word> wordList = await _repository.fetchWordList(topicId);
    _wordFetcher.sink.add(wordList);
  }

  dispose() {
    _wordFetcher.close();
  }
  
}

final wordBloc =WordBloc();