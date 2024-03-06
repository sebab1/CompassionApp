abstract class ISqlDatabase {
  Future<List<Map<String, Object?>>> readJournalEvents();
}
