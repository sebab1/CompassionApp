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

  var sql = SqlDatabase(sl());

  // await sql.deleteDatabase(await getDatabasesPath());

  sl.registerLazySingleton<ISqlDatabase>(() => sql);

  sl.registerLazySingleton<IJournalController>(() => JournalController(sl()));
}

Future<Database> _initDatabase() async {
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

    },
    version: 1,
  );
}
