// import 'package:mockito/mockito.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'dart:convert';
// import 'package:http/http.dart' show Client, Response;
// import '../../lib/src/common/app_config.dart';
// import '../mocking_test_data.dart';
// import '../../lib/src/resources/word_api_provider.dart';
// import '../../lib/src/models/word.dart';
// import '../../lib/src/resources/db/database.dart';
// import '../mocking_test_data.dart';
// import 'package:sqflite/sqflite.dart';

// DBProvider db;

// class MockClient extends Mock implements Client {}

// main() {

//   group("insert and fetch", () {

//     setUp(() async {
//       db = DBProvider.db;
//     });

//     tearDownAll(() async {
//       DBProvider.db.tearDown();    
//     });

//     test("insert word and topic", () async {

//       var res = await db.newTopic(MockingData.TOPIC[0]);
//       expect(res, 1);

//       final client = new MockClient();
//       final apiProvider = new WordApiProvider(client);

//       when(client.get(AppConfig.API_URL)).thenAnswer((_) async => Response(MockingData.WORD, 200));

//       List<Word> wordList =await apiProvider.fetchWordList();

//       res =await db.newWordList(wordList);
    
//       List<Word> words = await db.getWordsByTopicId(1);

//       expect(words.length, 2);
//       expect(words[0].name, "aspirin");
//     });
//   });
// }