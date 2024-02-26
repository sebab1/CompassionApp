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
  //bool isCurrentDaySelected = false;
  DateTime today = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
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
                  "Din dagbog for " + _selectedDay.toString(),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 12),
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
                    debugPrint("Pressed");
                  } : null,
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
            Text("Current day?: " + isCurrentDaySelected.toString()),
            SizedBox(height: 20), // Add some space
          ],
        ),
      ),
    );
  }
}
