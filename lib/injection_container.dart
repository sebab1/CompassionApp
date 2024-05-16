import 'package:chaleno/chaleno.dart';
import 'package:compassion_app/Data/ISqlDatabase.dart';
import 'package:compassion_app/Data/SqlDatabase.dart';
import 'package:compassion_app/Domain/Controllers/IJournalController.dart';
import 'package:compassion_app/Domain/Controllers/INotificationController.dart';
import 'package:compassion_app/Domain/Controllers/IScraperController.dart';
import 'package:compassion_app/Domain/Controllers/JournalController.dart';
import 'package:compassion_app/Domain/Controllers/ScraperController.dart';
import 'package:compassion_app/Domain/NotificationController.dart';
import 'package:compassion_app/Presentation/Components/notification_settings.dart';
import 'package:compassion_app/Presentation/journalNew.dart';
import 'package:compassion_app/Presentation/kollega_cafe.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Data/db.dart' as db;

final sl = GetIt.instance;

Future<void> init() async {
  final Database database = await db.initDatabase();

  sl.registerLazySingleton<Database>(() => database);

  var sql = SqlDatabase(sl());

  //await sql.deleteDatabase();

  sl.registerLazySingleton<IScraperController>(() => ScraperController(Chaleno()));

  sl.registerLazySingleton<KollegaCafe>(() => KollegaCafe(sc: sl()));

  sl.registerLazySingleton<ISqlDatabase>(() => sql);

  sl.registerLazySingleton<IJournalController>(() => JournalController(sl()));

  sl.registerLazySingleton<JournalNew>(
      () => JournalNew(ijournalController: sl()));

  sl.registerLazySingleton<INotificationController>(() => NotificationController());

  sl.registerLazySingleton<NotificationSettings>(
      () => NotificationSettings(notificationController: sl()));
}
