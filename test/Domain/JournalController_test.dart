import 'dart:math';

import 'package:compassion_app/Data/SqlDatabase.dart';
import 'package:compassion_app/Domain/Controllers/JournalController.dart';
import 'package:compassion_app/Domain/JournalEvent.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';


import 'JournalController_test.mocks.dart';
@GenerateNiceMocks([MockSpec<SqlDatabase>()])

void main(){
  late SqlDatabase sql;
  late JournalController jc;

  setUp(() {
    sql = MockSqlDatabase();
    jc = JournalController(sql);
  });


  test('getJournalEvents() checks if the data is correct', () async {

    //Arrange
      var data = [{'entry_id': 1, 'activity_id': 1, 'intention_id': null, 'date': 1715076782024, 'activity_desc': '123', 'intention_desc': null, 'checked': null}];

      Map<String, List<JournalEvent>> result = {'5/7/2024': [JournalEvent(null, '123', 1, null, 1, [])]};

      when(sql.readJournalEvents()).thenAnswer( (_) async => Future.value(data));


    //Act
      var jcResult = await jc.getJournals();

    //Assert
    
      //Checks the key for the map
      expect(jcResult.keys.first, result.keys.first);

      var journalEvent = jcResult[jcResult.keys.first]!.first;
      var resultJE = result[result.keys.first]!.first;
     
      expect(journalEvent.entry_ID, resultJE.entry_ID);
      expect(journalEvent.intention_ID, resultJE.intention_ID);
      expect(journalEvent.intentions, resultJE.intentions);
      expect(journalEvent.journal, resultJE.journal);
      expect(journalEvent.journal_ID, resultJE.journal_ID);
      expect(journalEvent.intentionsChecked, resultJE.intentionsChecked);
      verify(sql.readJournalEvents()).called(1);
  });

  test('saveActivity should call addActivity with correct arguments', () async {
  // Arrange
  final entryId = 1;
  final activity = 'Test activity';

  // Act
  await jc.saveActivity(entryId, activity);

  // Assert
  verify(sql.addActivity(entryId, activity)).called(1);
});

  test('saveEntry should call addEntry with correct timestamp', () async {
  // Arrange
  final timestamp = DateTime.now();

  // Act
  await jc.saveEntry(timestamp);

  // Assert
  verify(sql.addEntry(timestamp)).called(1);
});

test('saveIntentions should call addIntention with correct arguments', () async {
  // Arrange
  final entryId = 1;
  final intentions = 'Test intentions';

  // Act
  await jc.saveIntentions(entryId, intentions);

  // Assert
  verify(sql.addIntention(entryId, intentions)).called(1);
});

test('saveChecked should call saveChecked with correct arguments', () async {
  // Arrange
  final entryId = 1;
  final checked = [true, false, true]; 

  // Act
  await jc.saveChecked(checked, entryId);

  // Assert
  final expectedString = '1,0,1';
  verify(sql.saveChecked(expectedString, entryId)).called(1);
});
}

