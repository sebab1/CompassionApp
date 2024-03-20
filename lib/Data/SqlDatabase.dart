import 'package:compassion_app/Data/ISqlDatabase.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class SqlDatabase implements ISqlDatabase {
  Database db;

  SqlDatabase(this.db);
  

  @override
  Future<List<Map<String, Object?>>> readJournalEvents() async {

    String stoneAgeQuery = 'SELECT entries.entry_id, activity_id, intention_id, entries.date, activityJournal.activity_desc, intentionJournal.intention_desc ' +
                   ' FROM entries ' +
                    'LEFT JOIN activityJournal ON activityJournal.entry_id = entries.entry_id ' +
                    'LEFT JOIN intentionJournal ON intentionJournal.entry_id = entries.entry_id ' +
                    'UNION ' +
                    'SELECT entries.entry_id, activity_id, intention_id, entries.date, activityJournal.activity_desc, intentionJournal.intention_desc ' +
                    'FROM activityJournal ' +
                    'LEFT JOIN entries ON activityJournal.entry_id = entries.entry_id ' +
                    'LEFT JOIN intentionJournal ON intentionJournal.entry_id = entries.entry_id ' +
                    'WHERE entries.entry_id IS NULL ' +
                    'UNION ' +
                    'SELECT entries.entry_id, activity_id, intention_id, entries.date, activityJournal.activity_desc, intentionJournal.intention_desc ' +
                    'FROM intentionJournal ' +
                    'LEFT JOIN entries ON intentionJournal.entry_id = entries.entry_id ' +
                    'LEFT JOIN activityJournal ON activityJournal.entry_id = entries.entry_id ' +
                    'WHERE entries.entry_id IS NULL';

  String newQuery = 'SELECT entries.entry_id, activity_id, intention_id, entries.date, activityJournal.activity_desc, intentionJournal.intention_desc FROM "entries" FULL JOIN activityJournal ON activityJournal.entry_id = entries.entry_id FULL JOIN intentionJournal ON intentionJournal.entry_id = entries.entry_id';

    final queryResult = await db.rawQuery(stoneAgeQuery);

    print('data: $queryResult');
    final q1 = await db.rawQuery('SELECT * FROM activityJournal');
    final q2 = await db.rawQuery('SELECT * FROM intentionJournal');
    final q3 = await db.rawQuery('SELECT * FROM entries');
    print(q1);
    print(q2);
    print(q3);

    return queryResult;
  }

  Future<void> deleteDatabase(String path) async {
    print('deleting db');
    databaseFactory.deleteDatabase(path);
  }

  @override
  Future<void> addActivity(int entryID, String content) async {
    // String insert1 =
    //     'INSERT INTO activityJournal(entry_id, activity_desc) VALUES(?,?) ON CONFLICT(activityJournal.entry_id) DO UPDATE SET activity_desc = excluded.activity_desc';

    String insert = 'INSERT OR IGNORE INTO activityJournal (entry_id, activity_desc) VALUES (?, ?)';
    String update = 'UPDATE activityJournal SET activity_desc = ? WHERE entry_id = ?';
    final execute = await db.rawInsert(insert, [entryID, content]);
    if(execute == 0){
       final executeUpdate = await db.rawInsert(update, [content, entryID]);
      print('Update: $executeUpdate');
    }
    print('Insert: $execute');

  }

  Future<int> addEntry(DateTime time) async {
    final prompt =
        await db.insert('entries', {'date': time.millisecondsSinceEpoch});
    print('addEntry: $prompt');

    return prompt;
  }

  @override
  Future<void> addIntention(int entryID, String content) async {
    // String prompt =
    //     'INSERT INTO intentionJournal(entry_id, intention_desc) VALUES(?,?) ON CONFLICT(intentionJournal.entry_id) DO UPDATE SET intention_desc = excluded.intention_desc';

    String insert = 'INSERT OR IGNORE INTO intentionJournal (entry_id, intention_desc) VALUES (?, ?)';
    String update = 'UPDATE intentionJournal SET intention_desc = ? WHERE entry_id = ?';
    final execute = await db.rawInsert(insert, [entryID, content]);
    if(execute == 0) {
          final executeUpdate = await db.rawInsert(update, [content, entryID]);
          print('Update: $executeUpdate');
    }
    print('Insert: $execute');
  }
}
