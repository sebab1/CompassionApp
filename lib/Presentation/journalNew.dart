import 'package:compassion_app/Data/SqlDatabase.dart';
import 'package:compassion_app/Domain/Controllers/JournalController.dart';
import 'package:compassion_app/Domain/JournalEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '/Presentation/Components/constants.dart';

class JournalNew extends StatefulWidget {
  const JournalNew({Key? key}) : super(key: key);

  @override
  _JournalNewState createState() => _JournalNewState();
}

class _JournalNewState extends State<JournalNew> {
  Map<DateTime, List<JournalEvent>> selectedEvents = {};

  DateTime today = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  late TextEditingController _journalController;
  late TextEditingController _intentionController1;
  late TextEditingController _intentionController2;
  late TextEditingController _intentionController3;

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  Future<Map<DateTime, List<JournalEvent>>> getData() async {
    var sql = SqlDatabase();
    await sql.init();
    return await JournalController(sql).getJournals();
  }

  List<JournalEvent> _getEventsForDay(DateTime day) {
    return selectedEvents[day] ?? [];
  }

  @override
  void initState() {
    super.initState();

    getData().then((value) => selectedEvents = value);

    _journalController = TextEditingController();
    _intentionController1 = TextEditingController();
    _intentionController2 = TextEditingController();
    _intentionController3 = TextEditingController();
  }

  @override
  void dispose() {
    _journalController.dispose();
    _intentionController1.dispose();
    _intentionController2.dispose();
    _intentionController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isCurrentDaySelected = isSameDay(today, DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dagbog',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Constants.kBlackColor,
          ),
        ),
        backgroundColor: Constants.sduRedColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: TableCalendar(
                startingDayOfWeek: StartingDayOfWeek.monday,
                locale: 'en_US',
                availableGestures: AvailableGestures.all,
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                rowHeight: 38,
                focusedDay: _focusedDay,
                firstDay: DateTime.utc(2024, 1, 1),
                lastDay: DateTime.utc(2028, 12, 1),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                //onDaySelected: _onDaySelected,
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                    _onDaySelected(selectedDay, focusedDay);
                  }
                },
                eventLoader: (day) {
                  return _getEventsForDay(day);
                },
                //enabledDayPredicate: (day) => true,
                calendarStyle: const CalendarStyle(
                  todayTextStyle: TextStyle(
                    color: Constants.sduWhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Constants.sduRedColor,
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: TextStyle(
                    color: Constants.sduWhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Constants.sduGoldColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Din dagbog for d. " +
                      DateFormat('dd/MM').format(_selectedDay),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  isCurrentDaySelected
                      ? _getEventsForDay(DateTime.fromMillisecondsSinceEpoch(
                              1709732102314))
                          .length
                          .toString()
                      : '',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Dine intentioner for d. " +
                      DateFormat('dd/MM').format(_selectedDay),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 22),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Vis intentionjournal/event tekst fra den valgte dag her",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: isCurrentDaySelected
                      ? () {
                          debugPrint("Pressed");
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Tilføj dagbog for i dag'),
                              content: TextFormField(
                                controller: _journalController,
                                maxLines: 6,
                                decoration: InputDecoration(
                                  hintText: 'Skriv din dagbog her... ✏️',
                                ),
                              ),
                              actions: [
                                // Add any actions/buttons here
                                TextButton(
                                  child: const Text(
                                    'Luk',
                                    style: TextStyle(
                                      color:
                                          Constants.kBlackColor, // Text color
                                      fontSize: 16.0, // Font size
                                      // Add more styles as needed
                                    ),
                                  ),
                                  onPressed: () {
                                    _journalController.clear();
                                    Navigator.pop(context);
                                  },
                                ),
                                TextButton(
                                  child: const Text(
                                    'Tilføj',
                                    style: TextStyle(
                                      color:
                                          Constants.kBlackColor, // Text color
                                      fontSize: 16.0, // Font size
                                      // Add more styles as needed
                                    ),
                                  ),
                                  onPressed: () {
                                    print(selectedEvents);
                                    if (_journalController.text.isEmpty) {
                                      _journalController.clear();
                                      Navigator.pop(context);
                                      return;
                                    } else {
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    disabledBackgroundColor: Constants.sduGreyColor,
                    backgroundColor: Constants.sduGoldColor,
                  ),
                  child: Text(
                    "Tilføj ny journal",
                    style: TextStyle(
                      color: isCurrentDaySelected
                          ? Constants.kBlackColor // Text color when enabled
                          : Constants.kGreyColor, // Text color when disabled
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: isCurrentDaySelected
                      ? () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Tilføj intentioner for i dag'),
                              content: Column(
                                children: [
                                  TextFormField(
                                    controller: _intentionController1,
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                      hintText: 'Skriv en intention her... ✏️',
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Constants.sduGoldColor,
                                        ),
                                      ),
                                      focusColor: Constants.sduRedColor,
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _intentionController2,
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                      hintText:
                                          'Skriv din anden intention her... ✏️',
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Constants.sduGoldColor,
                                        ),
                                      ),
                                      focusColor: Constants.sduRedColor,
                                    ),
                                  ),
                                  TextFormField(
                                    controller: _intentionController3,
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                      hintText:
                                          'Skriv din tredje intention her... ✏️',
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Constants.sduGoldColor,
                                        ),
                                      ),
                                      focusColor: Constants.sduRedColor,
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                // Add any actions/buttons here
                                TextButton(
                                  child: const Text(
                                    'Luk',
                                    style: TextStyle(
                                      color: Constants.kBlackColor,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  onPressed: () {
                                    _intentionController1.clear();
                                    _intentionController2.clear();
                                    _intentionController3.clear();
                                    Navigator.pop(context);
                                  },
                                ),
                                TextButton(
                                  child: const Text(
                                    'Tilføj',
                                    style: TextStyle(
                                      color: Constants.kBlackColor,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  onPressed: () {
                                    // Handle 'Tilføj' button press
                                    if (_intentionController1.text.isEmpty &&
                                        _intentionController2.text.isEmpty &&
                                        _intentionController3.text.isEmpty) {
                                      // Handle case when all three fields are empty
                                      Navigator.pop(context);
                                      return;
                                    } else {
                                      // Handle the case when at least one field is non-empty
                                      debugPrint("Lukker uden text");
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    disabledBackgroundColor: Constants.sduGreyColor,
                    backgroundColor: Constants.sduGoldColor,
                  ),
                  child: Text(
                    "Tilføj nye intentioner",
                    style: TextStyle(
                      color: isCurrentDaySelected
                          ? Constants.kBlackColor // Text color when enabled
                          : Constants.kGreyColor, // Text color when disabled
                    ),
                  ),
                ),
              ],
            ),
            Text("Get selected day: " + _selectedDay.toString()),
            //Text("Current day?: " + isCurrentDaySelected.toString()),
            SizedBox(height: 20), // Add some space
          ],
        ),
      ),
    );
  }
}
