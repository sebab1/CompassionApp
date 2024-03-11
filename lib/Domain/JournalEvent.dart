class JournalEvent {
  int? entry_ID;
  int? journal_ID;
  int? intention_ID;
  String? intentions;
  String? journal;

  JournalEvent(this.intentions, this.journal, this.journal_ID,
      this.intention_ID, this.entry_ID);

  @override
  String toString() {
    return 'intentions: $intentions, intention_id: $intention_ID, journal: $journal, journal_ID: $journal_ID';
  }
}
