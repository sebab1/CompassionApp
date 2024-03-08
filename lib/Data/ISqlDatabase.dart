abstract class ISqlDatabase {
  Future<List<Map<String, Object?>>> readJournalEvents();

  Future<void> addIntention(int entryID, String content);

  Future<void> addActivity(int entryID, String content);
}
