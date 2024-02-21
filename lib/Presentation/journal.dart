import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';
import '/Presentation/Components/constants.dart';

class Journal extends StatefulWidget {
  const Journal({Key? key}) : super(key: key);

  @override
  _JournalState createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  DateTime today = DateTime.now();
  TextEditingController journalController = TextEditingController();
  TextEditingController intentionController1 = TextEditingController();
  TextEditingController intentionController2 = TextEditingController();
  TextEditingController intentionController3 = TextEditingController();

  Map<DateTime, List<dynamic>> events = {
    DateTime.utc(2024, 2, 15): ['Event 1'],
    DateTime.utc(2024, 2, 17): ['Event 2'],
    // Add more events as needed
  };

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  bool _hasEvent(DateTime day) {
    // Check if the day has an event in the events map
    return events.containsKey(day);
  }

  @override
  Widget build(BuildContext context) {
    bool isCurrentDaySelected = isSameDay(today, DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text('Dagbog'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: TableCalendar(
                startingDayOfWeek: StartingDayOfWeek.monday,
                locale: 'en_US',
                availableGestures: AvailableGestures.all,
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                rowHeight: 38,
                focusedDay: today,
                firstDay: DateTime.utc(2024, 1, 1),
                lastDay: DateTime.utc(2028, 12, 1),
                selectedDayPredicate: (day) => _hasEvent(day),
                onDaySelected: _onDaySelected,
                enabledDayPredicate: (day) => true,
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
              margin: EdgeInsets.fromLTRB(16, 14, 0, 6),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Beskriv din dag",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: TextField(
                  controller: journalController,
                  enabled: isCurrentDaySelected,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: isCurrentDaySelected
                        ? 'Skriv dagbog for i dag'
                        : 'Vis log for den dag fra database her',
                    filled: true,
                    fillColor: Constants.sduGreyColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                ),
              ),
            ),
            Text("Get selected day: ${today.toString().split(" ")[0]}"),
            Container(
              margin: EdgeInsets.fromLTRB(16, 10, 0, 6),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Skriv dine intentioner for dagen her",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: TextField(
                  controller: intentionController1,
                  enabled: isCurrentDaySelected,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: 'Intention 1',
                    filled: true,
                    fillColor: Constants.sduGreyColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: TextField(
                  controller: intentionController2,
                  enabled: isCurrentDaySelected,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: 'Intention 2',
                    filled: true,
                    fillColor: Constants.sduGreyColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: TextField(
                  controller: intentionController3,
                  enabled: isCurrentDaySelected,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: 'Intention 3',
                    filled: true,
                    fillColor: Constants.sduGreyColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 10, 0, 6),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Test text",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
