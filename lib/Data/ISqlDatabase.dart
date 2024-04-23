abstract class ISqlDatabase {
  Future<List<Map<String, Object?>>> readJournalEvents();

  Future<void> addIntention(int entryID, String content);

  Future<void> saveChecked(String checked, int entryID);

  Future<void> addActivity(int entryID, String content);

  Future<int> addEntry(DateTime time);
}
