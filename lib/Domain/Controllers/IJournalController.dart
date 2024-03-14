import 'package:compassion_app/Domain/JournalEvent.dart';

abstract class IJournalController {
  Future<Map<String, List<JournalEvent>>> getJournals();

  Future<int> saveEntry(DateTime time);

  Future<void> saveActivity(int entry_id, String activity);

  Future<void> saveIntentions(int entry_id, String intentions);
}
