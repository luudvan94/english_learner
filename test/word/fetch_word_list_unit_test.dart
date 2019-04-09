import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import '../../lib/src/common/app_config.dart';
import '../mocking_test_data.dart';
import '../../lib/src/resources/word_api_provider.dart';
import '../../lib/src/models/word.dart';

class MockClient extends Mock implements Client {}

main() {
  
  group('fetchWord', () {
    test('return a Word if the http call completes successfully', () async {

      final client = new MockClient();
      final apiProvider = new WordApiProvider();

      when(client.get(AppConfig.API_URL)).thenAnswer((_) async => Response(MockingData.WORD, 200));

      Word word =await apiProvider.fetchWordList(client);
      expect(word, isInstanceOf<Word>());
      expect(word.name, "aspirin");
      expect(word.typeWord, "noun");
      expect(word.topic, "health");
      expect(word.id, 1);

      assert(word.definitions.length > 0);
      expect(word.definitions.first.wordId, word.id);

      var definition = word.definitions.first;
      assert(definition.examples.length > 0);
      expect(definition.examples.first.definitionId, definition.id);
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();
      final apiProvider = new WordApiProvider();

      when(client.get(AppConfig.API_URL))
          .thenAnswer((_) async => Response('Not Found', 404));

      expect(apiProvider.fetchWordList(client), throwsException);
    });
  });
}