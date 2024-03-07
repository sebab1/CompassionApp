import 'package:compassion_app/Domain/JournalEvent.dart';

abstract class IJournalController {
  Future<Map<String, List<JournalEvent>>> getJournals();
}
