import 'package:compassion_app/Domain/JournalEvent.dart';
import 'package:compassion_app/Presentation/journalNew.dart';

abstract class IDatabaseHandler {
  Future<Map<DateTime, JournalEvent>> readJournalEvents();
}
