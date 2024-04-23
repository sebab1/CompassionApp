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

final expectedDBVersion = 2;

Future<void> init() async {
  final Database database = await _initDatabase();
  sl.registerLazySingleton<Database>(() => database);

  var sql = SqlDatabase(sl());

  //await sql.deleteDatabase(await getDatabasesPath());
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
  print(upgradeToVersion);
  switch (upgradeToVersion) {
    //Upgrade to V1 (initial creation)
    case 1:
      await _dbUpdatesVersion_1(db);
      break;

    //Upgrades for V2
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
      'ALTER TABLE intentionJournal ADD COLUMN checked INTEGER NOT NULL DEFAULT 0;');
}

Future<void> deleteDatabase(String path) =>
    databaseFactory.deleteDatabase(path);
