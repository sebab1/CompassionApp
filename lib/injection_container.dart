import 'package:compassion_app/Data/ISqlDatabase.dart';
import 'package:compassion_app/Data/SqlDatabase.dart';
import 'package:compassion_app/Domain/Controllers/IJournalController.dart';
import 'package:compassion_app/Domain/Controllers/JournalController.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final sl = GetIt.instance;

final String db_name = 'sqlite-db';

Future<void> init() async {
  final Database database = await _initDatabase();
  sl.registerLazySingleton<Database>(() => database);

  sl.registerLazySingleton<ISqlDatabase>(() => SqlDatabase(sl()));

  sl.registerLazySingleton<IJournalController>(() => JournalController(sl()));
}

Future<Database> _initDatabase() async {
  print('creating db');
  String path = await getDatabasesPath();
  return await openDatabase(
    join(path, db_name),
    onCreate: (db, version) {
      print('creating tables');
      String entriesTable =
          'CREATE TABLE IF NOT EXISTS entries(entry_id INTEGER PRIMARY KEY AUTOINCREMENT, date INTEGER NOT NULL)';
      String activityJournalTable =
          'CREATE TABLE IF NOT EXISTS activityJournal(activity_id INTEGER PRIMARY KEY AUTOINCREMENT, entry_id INTEGER NOT NULL UNIQUE, activity_desc TEXT NOT NULL, FOREIGN KEY (entry_id) REFERENCES entries)';
      String intentionTable =
          'CREATE TABLE IF NOT EXISTS intentionJournal(intention_id INTEGER PRIMARY KEY AUTOINCREMENT, entry_id INTEGER NOT NULL UNIQUE, intention_desc TEXT NOT NULL, FOREIGN KEY (entry_id) REFERENCES entries)';

      db.execute(entriesTable);
      db.execute(activityJournalTable);
      db.execute(intentionTable);

      print('inserting data into tables');
      //Insert data into entries table
      db.insert('entries', {'date': 1709732102314});

      db.insert('entries', {'date': 1709815880812});

      //Insert data into activity journal table
      db.insert(
          'activityJournal', {'entry_id': 1, 'activity_desc': 'ZAAAZAAA'});

      //Insert data into intention table
      db.insert('intentionJournal', {
        'entry_id': 1,
        'intention_desc': 'intention 1;#intention 2;#intention 3'
      });

      // await db.insert('intentionJournal', {
      //   'entry_id': 2,
      //   'intention_desc': 'intention 4, intention 5, intention 6'
      // });
    },
    version: 1,
  );
}
