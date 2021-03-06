// import 'dart:io';

// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// import '../../models/word.dart';
// import '../../models/definition.dart';
// import '../../models/example.dart';
// import '../../models/topic.dart';

// class DBProvider {

//   DBProvider._();

//   static final DBProvider db = new DBProvider._();

//   static Database _database;

//   static String CREATE_TABLE_TOPIC_SQL = """
//   CREATE TABLE IF NOT EXISTS topic(
//     id INTEGER PRIMARY KEY,
//     name TEXT NOT NULL,
//     description TEXT NOT NULL,
//     isDownloaded INTEGER DEFAULT 0
//   );""";  

//   static String CREATE_TABLE_WORD_SQL = """
//   CREATE TABLE IF NOT EXISTS word (
//     id INTEGER PRIMARY KEY,
//     name TEXT NOT NULL,
//     topic_id INTEGER NOT NULL,
//     type_word TEXT NOT NULL,
//     pronounce TEXT,
//     audio_link TEXT,
//     link TEXT
// );""";

//   static String CREATE_TABLE_DEFINITION_SQL = """
//   CREATE TABLE IF NOT EXISTS definition (
// 	  id INTEGER PRIMARY KEY,
// 	  defi TEXT NOT NULL,
// 	  word_id INTEGER NOT NULL
// );""";

//   static String CREATE_TABLE_EXAMPLE_SQL = """
//   CREATE TABLE IF NOT EXISTS example (
// 	id INTEGER PRIMARY KEY,
// 	exam TEXT NOT NULL,
// 	defi_id INTEGER NOT NULL
// );""";

//   static String _DB_PATH = "";

//   Future<Database> get database async {
//     if (_database != null) {

//       return _database;
//     }

//     _database = await initDB();
//     return _database;
//   }

//   initDB() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     _DB_PATH = join(documentsDirectory.path, "TestDB.db");
//     return await openDatabase(_DB_PATH, version: 1, onOpen: (db) {
//     }, onCreate: (Database db, int version) async {
//       Batch batch = db.batch();

//       batch.execute(DBProvider.CREATE_TABLE_TOPIC_SQL);
//       batch.execute(DBProvider.CREATE_TABLE_WORD_SQL);
//       batch.execute(DBProvider.CREATE_TABLE_DEFINITION_SQL);
//       batch.execute(DBProvider.CREATE_TABLE_EXAMPLE_SQL);

//       await batch.commit();
//     });
//   }

//   tearDown() async{
//     await deleteDatabase(_DB_PATH);
//   }

//   newTopic(Topic topic) async {
//     final db = await database;
//     var res = await db.insert(Topic.TABLE_NAME, topic.toMap());
//     return res;
//   }

//   newWordList(List<Word> wordList) async {
//     final db =await database;
//     var batch = db.batch();

//     for (var word in wordList) {
//       batch.insert(Word.TABLE_NAME, word.toMap());

//       for (var def in word.definitions) {
//         batch.insert(Definition.TABLE_NAME, def.toMap());

//         for (var exam in def.examples) {
//           batch.insert(Example.TABLE_NAME, exam.toMap());
//         }
//       }
//     }
//     var res = await batch.commit();
//     return res;
//   }

//   newWord(Word word) async {
//     final db =await database;
//     var batch = db.batch();

//     batch.insert(Word.TABLE_NAME, word.toMap());

//     for (var def in word.definitions) {
//       batch.insert(Definition.TABLE_NAME, def.toMap());

//       for (var exam in def.examples) {
//         batch.insert(Example.TABLE_NAME, exam.toMap());
//       }
//     }

//     var res = await batch.commit();
//     return res;
//   }

//   Future<List<Word>> getWordsByTopicId(int topicId) async {
//     final db =_database;
//     var batch = db.batch();
//     List<Map> maps_words = await db.query(Word.TABLE_NAME,
//         where: Word.COLUMN_TOPIC_ID + ' = ?',
//         whereArgs: [topicId]);

//     List<Word> wordList = [];

//     if (maps_words.isEmpty) {
//       return wordList;
//     }


//     wordList = maps_words.map((map) => Word.fromMap(map)).toList();
//     if (wordList.length > 0) {
      
//       for (var word in wordList) {
//         List<Map> maps_definition = await db.query(Definition.TABLE_NAME,
//         where: Definition.COLUMN_WORD_ID + ' = ?',
//         whereArgs: [word.id]);

//         List<Definition> definitions =maps_definition.map((map) => Definition.fromMap(map)).toList();

//         for (var def in definitions) {
//           List<Map> maps_example = await db.query(Example.TABLE_NAME,
//             where: Example.COLUMN_DEFI_ID + ' = ?',
//             whereArgs: [def.id]);

//           List<Example> examples =maps_example.map((map) => Example.fromMap(map)).toList();
//           def.examples =examples;
//         }

//         word.definitions =definitions;
//       }
          
//     }

//     return wordList;
//   }
// }