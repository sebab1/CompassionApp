import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';
import '/Presentation/Components/constants.dart';

class JournalNew extends StatefulWidget {
  const JournalNew({Key? key}) : super(key: key);

  @override
  _JournalNewState createState() => _JournalNewState();
}

class _JournalNewState extends State<JournalNew> {

  DateTime today = DateTime.now();
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  TextEditingController journalController = TextEditingController();
  TextEditingController intentionController1 = TextEditingController();
  TextEditingController intentionController2 = TextEditingController();
  TextEditingController intentionController3 = TextEditingController();

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
                focusedDay: selectedDay,
                firstDay: DateTime.utc(2024, 1, 1),
                lastDay: DateTime.utc(2028, 12, 1),
                onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                  setState(() {
                    this.selectedDay = selectedDay;
                    this.focusedDay = focusedDay;
                  });
                  print("Selected day: " + selectedDay.toString());
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
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
              margin: EdgeInsets.fromLTRB(20, 12, 0, 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Vis journal/event tekst fra den valgte dag her",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 12, 0, 12),
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
                  } : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Constants.sduGoldColor,
                  ),
                  child: Text("Tilføj journal"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your logic for the second button here
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Constants.sduGoldColor,
                  ),
                  child: Text("Tilføj intentioner"),
                ),
              ],
            ),
            Text("Get selected day: " + selectedDay.toString()),
            SizedBox(height: 20), // Add some space
          ],
        ),
      ),
    );
  }
}
