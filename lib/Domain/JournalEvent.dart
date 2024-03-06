class JournalEvent {
  String? intentions;
  String? journal;

  JournalEvent(this.intentions, this.journal);

  @override
  String toString() {
    return 'intentions: $intentions, journal: $journal';
  }
}
