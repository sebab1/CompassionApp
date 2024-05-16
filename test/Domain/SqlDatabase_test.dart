import 'dart:async';

import 'package:compassion_app/Data/SqlDatabase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:chaleno/chaleno.dart';
import 'package:compassion_app/Domain/Controllers/ScraperController.dart';
import 'package:sqflite/sqflite.dart';

import 'SqlDatabase_test.mocks.dart';


@GenerateNiceMocks([MockSpec<Database>()])

void main(){
  late MockDatabase db;
  late SqlDatabase sqlDatabase;

  setUp(() {
    db = MockDatabase();
    sqlDatabase = SqlDatabase(db);
  });

  test('readJournalEvents should return correct data', () async {
  // Arrange

  final expectedQueryResult = [
    {'entry_id': 1, 'activity_id': 1, 'intention_id': null, 'date': 1715076782024}
  ];

  when(db.rawQuery(any)).thenAnswer((_) async => expectedQueryResult);

  // Act
  final result = await sqlDatabase.readJournalEvents();

  // Assert
  expect(result, expectedQueryResult);
});

test('addActivity should insert or update activity', () async {
  // Arrange
  final entryId = 1;
  final content = 'Test activity';

  when(db.rawInsert(any, any)).thenAnswer((_) async => 1); // Assuming successful insert/update

  // Act
  await sqlDatabase.addActivity(entryId, content);

  // Assert
  verify(db.rawInsert(any, any)).called(1); 
});


  test('addEntry() inserts a new entry into the database', () async {
    // Arrange
    final time = DateTime.now();

    // Act
    final result = await sqlDatabase.addEntry(time);

    // Assert
    verify(db.insert('entries', {'date': time.millisecondsSinceEpoch}));
    expect(result, isA<int>());
  });

  test('addIntention() inserts or updates an intention in the database', () async {
    // Arrange
    final entryID = 123;
    final content = 'Test Intention';

    // Act
    await sqlDatabase.addIntention(entryID, content);

    // Assert
    verify(db.rawInsert(any, [content, entryID])).called(1);
  });

  test('saveChecked() updates the checked field in the database', () async {
    // Arrange
    final checked = '1,0,1';
    final entryID = 123;

    // Act
    await sqlDatabase.saveChecked(checked, entryID);

    // Assert
    verify(db.rawUpdate('UPDATE intentionJournal SET checked = ? WHERE entry_id = ?', [checked, entryID]));
  });
}