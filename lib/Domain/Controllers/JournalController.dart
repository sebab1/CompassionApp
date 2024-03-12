import 'dart:math';

import 'package:compassion_app/Data/ISqlDatabase.dart';
import 'package:compassion_app/Domain/Controllers/IJournalController.dart';
import 'package:compassion_app/Domain/JournalEvent.dart';
import 'package:intl/intl.dart';

class JournalController implements IJournalController {
  ISqlDatabase database;

  JournalController(this.database);

  @override
  Future<Map<String, List<JournalEvent>>> getJournals() async {
    final data = await database.readJournalEvents();
    var map = Map.fromIterable(data, key: (element) {
      String dateFormat = DateFormat.yMd()
          .format(new DateTime.fromMillisecondsSinceEpoch(element['date']));
      ;
      return dateFormat;
    }, value: (element) {
      List<JournalEvent> list = [];
      list.add(JournalEvent(
          element['intention_desc'],
          element['activity_desc'],
          element['activity_id'],
          element['intention_id'],
          element['entry_id']));
      return list;
    });

    // map.forEach((key, value) {
    //   print(value.toString());
    // });

    return map;
  }
}