import 'package:compassion_app/Data/ISqlDatabase.dart';
import 'package:compassion_app/Data/SqlDatabase.dart';
import 'package:compassion_app/Domain/Controllers/IJournalController.dart';
import 'package:compassion_app/Domain/Controllers/IScraperController.dart';
import 'package:compassion_app/Domain/Controllers/JournalController.dart';
import 'package:compassion_app/Domain/Controllers/ScraperController.dart';
import 'package:compassion_app/Domain/notification_api.dart';
import 'package:compassion_app/Presentation/Components/notification_settings.dart';
import 'package:compassion_app/Presentation/journalNew.dart';
import 'package:compassion_app/Presentation/kollega_cafe.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final sl = GetIt.instance;

final String db_name = 'sqlite-db';

final expected_db_version = 2;

Future<void> init() async {
  final Database database = await _initDatabase();
  sl.registerLazySingleton<Database>(() => database);

  await editDatabase(database);

  var sql = SqlDatabase(sl());

  // await sql.deleteDatabase(await getDatabasesPath());
  sl.registerLazySingleton<IScraperController>(() => ScraperController());

  sl.registerLazySingleton<KollegaCafe>(() => KollegaCafe(sc: sl()));

  sl.registerLazySingleton<ISqlDatabase>(() => sql);

  sl.registerLazySingleton<IJournalController>(() => JournalController(sl()));

  sl.registerLazySingleton<JournalNew>(
      () => JournalNew(ijournalController: sl()));

  sl.registerLazySingleton<NotificationApi>(() => NotificationApi());

  sl.registerLazySingleton<NotificationSettings>(
      () => NotificationSettings(notificationApi: sl()));
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

Future editDatabase(Database db) async {
  int version = await db.getVersion();
  print('db version: $version');
  var future;
  if (version < expected_db_version) {
    var update = db
        .execute(
            'ALTER TABLE intentionJournal ADD COLUMN checked INTEGER NOT NULL DEFAULT 0; ')
        .then((value) => db.setVersion(2));
    print('updating db');
    future = update;
  }
  return future;
}

void _onUpgrade(Database db, int oldVersion, int newVersion) {
  if (oldVersion < newVersion) {
    // you can execute drop table and create table
    db.execute(
        'ALTER TABLE intentionJournal ADD COLUMN checked INTEGER NOT NULL DEFAULT 0;');
  }
}
