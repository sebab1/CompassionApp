import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String db_name = 'sqlite-db';

final expectedDBVersion = 2;

Future<Database> initDatabase() async {
  String path = await getDatabasesPath();
  return await openDatabase(join(path, db_name), version: expectedDBVersion,
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
    //
    //Iterate from the current version to the latest version and execute SQL statements
    for (int version = oldVersion; version < newVersion; version++) {
      await _performDBUpgrade(db, version + 1);
    }
  }, onCreate: (Database db, int newVersion) async {
    //
    //Start from version 1 to current version and create DB
    for (int version = 0; version < newVersion; version++) {
      await _performDBUpgrade(db, version + 1);
    }
  });
}

Future<void> _performDBUpgrade(Database db, int upgradeToVersion) async {
  switch (upgradeToVersion) {
    case 1:
      await _dbUpdatesVersion_1(db);
      break;
    case 2:
      await _dbUpdatesVersion_2(db);
      break;
  }
}

Future<void> _dbUpdatesVersion_1(Database db) async {
  print('creating tables');
  String entriesTable =
      'CREATE TABLE IF NOT EXISTS entries(entry_id INTEGER PRIMARY KEY AUTOINCREMENT, date INTEGER NOT NULL)';
  String activityJournalTable =
      'CREATE TABLE IF NOT EXISTS activityJournal(activity_id INTEGER PRIMARY KEY AUTOINCREMENT, entry_id INTEGER NOT NULL UNIQUE, activity_desc TEXT NOT NULL, FOREIGN KEY (entry_id) REFERENCES entries)';
  String intentionTable =
      'CREATE TABLE IF NOT EXISTS intentionJournal(intention_id INTEGER PRIMARY KEY AUTOINCREMENT, entry_id INTEGER NOT NULL UNIQUE, intention_desc TEXT NOT NULL, FOREIGN KEY (entry_id) REFERENCES entries)';

  await db.execute(entriesTable);
  await db.execute(activityJournalTable);
  await db.execute(intentionTable);
}

Future<void> _dbUpdatesVersion_2(Database db) async {
  print('adding new column');
  await db.execute(
      'ALTER TABLE intentionJournal ADD COLUMN checked TEXT NOT NULL DEFAULT [0,0,0];');
}

Future<void> deleteDatabase(String path) =>
    databaseFactory.deleteDatabase(path);
