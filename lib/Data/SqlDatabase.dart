import 'package:compassion_app/Data/ISqlDatabase.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class SqlDatabase implements ISqlDatabase {
  late Database db;

  // this opens the database (and creates it if it doesn't exist)
  Future<void> init() async {
    print('creating db');
    final path = join(await getDatabasesPath(), 'journal.db');
    db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, int version) async {
    print('Creating tables');
    String entriesTable =
        'CREATE TABLE IF NOT EXISTS entries(entry_id INTEGER PRIMARY KEY AUTOINCREMENT, date INTEGER NOT NULL)';
    String activityJournalTable =
        'CREATE TABLE IF NOT EXISTS activityJournal(activity_id INTEGER PRIMARY KEY AUTOINCREMENT, entry_id INTEGER NOT NULL UNIQUE, activity_desc TEXT NOT NULL, FOREIGN KEY (entry_id) REFERENCES entries)';
    String intentionTable =
        'CREATE TABLE IF NOT EXISTS intentionJournal(intention_id INTEGER PRIMARY KEY AUTOINCREMENT, entry_id INTEGER NOT NULL, intention_desc TEXT NOT NULL, FOREIGN KEY (entry_id) REFERENCES entries)';

    await db.execute(entriesTable);
    await db.execute(activityJournalTable);
    await db.execute(intentionTable);

    print('inserting data into tables');
    //Insert data into entries table
    await db.insert('entries', {'date': 1709732102314});

    await db.insert('entries', {'date': 1709815880812});

    //Insert data into activity journal table
    await db.insert(
        'activityJournal', {'entry_id': 1, 'activity_desc': 'ZAAAZAAA'});

    //Insert data into intention table
    await db.insert('intentionJournal', {
      'entry_id': 1,
      'intention_desc': 'intention 1, intention 2, intention 3'
    });

    // await db.insert('intentionJournal', {
    //   'entry_id': 2,
    //   'intention_desc': 'intention 4, intention 5, intention 6'
    // });
  }

  @override
  Future<List<Map<String, Object?>>> readJournalEvents() async {
    final queryResult = await db.rawQuery(
        'SELECT entries.entry_id, activity_id, intention_id, entries.date, activityJournal.activity_desc, intentionJournal.intention_desc FROM "entries" FULL JOIN activityJournal ON activityJournal.entry_id = entries.entry_id FULL JOIN intentionJournal ON intentionJournal.entry_id = entries.entry_id');

    print('data: $queryResult');
    final q1 = await db.rawQuery('SELECT * FROM activityJournal');
    final q2 = await db.rawQuery('SELECT * FROM intentionJournal');
    final q3 = await db.rawQuery('SELECT * FROM entries');
    // print(q1);
    // print(q2);
    print(q3);

    return queryResult;
  }

  Future<int> insertData(String content, int entryID) async {
    print('Inserting data for activity journal');
    final query = await db.insert(
        'activityJournal', {'entry_id': entryID, 'activity_desc': content});

    return query;
  }

  Future<int> insert(String intention, String content, int entryID) async {
    print('Inserting data for activity journal');
    // final query1 = await db
    //     .insert('entries', {'date': DateTime.now().millisecondsSinceEpoch});
    final query2 = await db.insert(
        'intentionJournal', {'entry_id': entryID, 'intention_desc': intention});
    final query3 = await db.insert(
        'activityJournal', {'entry_id': entryID, 'activity_desc': content});

    return query3;
  }

  Future<int> deleteData(String table, int entryID) async {
    print('Deleting data for $table');
    final query =
        await db.delete(table, where: 'entry_id = ?', whereArgs: [entryID]);

    return query;
  }

  Future<void> deleteDatabase() async =>
      databaseFactory.deleteDatabase(await getDatabasesPath());

  @override
  Future<void> addActivity(int entryID, String content) async {
    String prompt =
        'INSERT INTO activityJournal(entry_id, activity_desc) VALUES(?,?) ON CONFLICT(activityJournal.entry_id) DO UPDATE SET activity_desc = excluded.activity_desc';
    final execute = await db.rawInsert(prompt, [entryID, content]);
    print('new activity: $execute');
  }

  Future<int> addEntry(DateTime time) async {
    final prompt =
        await db.insert('entries', {'date': time.millisecondsSinceEpoch});
    print('addEntry: $prompt');

    return prompt;
  }

  @override
  Future<void> addIntention(int entryID, String content) async {}
}
