import 'dart:math';

import 'package:compassion_app/Data/ISqlDatabase.dart';
import 'package:compassion_app/Domain/Controllers/IJournalController.dart';
import 'package:compassion_app/Domain/JournalEvent.dart';

class JournalController implements IJournalController {
  ISqlDatabase database;

  JournalController(this.database);

  @override
  Future<Map<DateTime, List<JournalEvent>>> getJournals() async {
    final data = await database.readJournalEvents();
    var map = Map.fromIterable(data,
        key: (element) =>
            new DateTime.fromMillisecondsSinceEpoch(element['date']),
        value: (element) {
          List<JournalEvent> list = [];
          list.add(JournalEvent(
              element['intention_desc'], element['activity_desc']));
          return list;
        });

    // map.forEach((key, value) {
    //   print(value.toString());
    // });

    return map;
  }
}
