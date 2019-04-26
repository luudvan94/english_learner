import 'word_api_provider.dart';
import '../models/word.dart';

class WordRepository {

  final wordApiProvider = new WordApiProvider.defaultProvider();

  Future<List<Word>> fetchWordList(int topicId) => wordApiProvider.fetchWordList(topicId);
}