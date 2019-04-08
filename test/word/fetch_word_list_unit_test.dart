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

      expect(await apiProvider.fetchWordList(client), isInstanceOf<Word>());
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