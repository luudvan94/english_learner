import '../lib/src/models/topic.dart';

class MockingData {

  static final WORD = '[{ "id": 1, "name": "aspirin", "typeWord": "noun", "pronounce": "abc", "audioLink": "aspiri01.mp3", "link": "http://learnersdictionary.com/definition/aspirin", "definitions": [ { "id": 1, "defi": "a medicine that reduces pain and fever", "examples": [ { "id": 1, "exam": "Aspirin is effective in controlling headaches." }, { "id": 2, "exam": "an aspirin pill" }, { "id": 3, "exam": "I had a headache so I took a couple of aspirins/aspirin. [=a couple of aspirin pills]" } ] } ], "topic": { "id": 1, "name": "health" } }, { "id": 2, "name": "allergy", "typeWord": "noun", "pronounce": "abcde", "audioLink": "allerg06.mp3", "link": "http://learnersdictionary.com/definition/allergy", "definitions": [ { "id": 2, "defi": "a medical condition that causes someone to become sick after eating, touching, or breathing something that is harmless to most people", "examples": [ { "id": 4, "exam": "Many people have some form of allergy." }, { "id": 5, "exam": "food allergies" }, { "id": 6, "exam": "I have an allergy to strawberries. I get a rash if I eat just one." }, { "id": 7, "exam": "My brother has an allergy to hard work. [=my brother does not like hard work; my brother is lazy]" } ] } ], "topic": { "id": 1, "name": "health" } }]';
  static final TOPIC = [
    Topic(1, "health", ""),
    Topic(2, "body", ""),
    Topic(3, "car", ""),
  ];
}