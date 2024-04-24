import 'package:compassion_app/Data/SqlDatabase.dart';
import 'package:compassion_app/Domain/Controllers/IJournalController.dart';
import 'package:compassion_app/Domain/Controllers/JournalController.dart';
import 'package:compassion_app/Domain/JournalEvent.dart';
import 'package:compassion_app/Presentation/Components/infoDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import '../injection_container.dart';
import '/Presentation/Components/constants.dart';
import 'Components/settings.dart';

class JournalNew extends StatefulWidget {
  final IJournalController ijournalController;
  const JournalNew({Key? key, required this.ijournalController})
      : super(key: key);

  @override
  _JournalNewState createState() => _JournalNewState();
}

class _JournalNewState extends State<JournalNew> {
  Map<String, List<JournalEvent>>? selectedEvents;

  late List<bool> intentionCb;
  late IJournalController jc;

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

  Future<Map<String, List<JournalEvent>>> getData() async {
    return await jc.getJournals();
  }

  void refreshData() {
    getData().then((value) => setState(() {
          selectedEvents = value;
        }));
  }

  List<JournalEvent> _getEventsForDay(DateTime day) {
    String dateFormat = DateFormat.yMd().format(day);
    return selectedEvents![dateFormat] ?? [];
  }

  @override
  void initState() {
    super.initState();
    jc = widget.ijournalController;
    getData().then((value) => setState(() {
          this.selectedEvents = value;
        }));

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
    if (selectedEvents == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Dagbogsnotat',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Constants.kBlackColor,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.settings_outlined,
                size: 26,
                color: Constants.kBlackColor,
              ),
              onPressed: () {
                showModalBottomSheet(
                  useRootNavigator: true,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return Settings();
                  },
                );
              },
            )
          ],
          leading: IconButton(
            icon: const Icon(
              Icons.info_outlined,
              size: 26,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return InfoDialog('Dagbogsnotat er et redskab du kan bruge til refleksion og selvudvikling. '
            'Du kan skrive dine umiddelbare tanker og følelser ned, eller bare hvad '
            'du har oplevet i dag, på godt og ondt. '
            '\n'
            'Ved at tilføje nye intentioner kan du også sætte dig personlige mål for dagen.'
            '\n'
            '\n'
            'Hverken dagbogsnotaterne eller dine personlige intentioner deles og gemmes '
            'andre steder, så det er kun dig der kan se indholdet her.', 'Om Dagbogsnotat'); // Use the InfoDialog here
                },
              );
            },
          ),
          backgroundColor: Constants.sduRedColor,
        ),
        floatingActionButton: floatingButtons(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: TableCalendar(
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  locale: 'da_DK',
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
                    "Din dagbog",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _getEventsForDay(_selectedDay).length > 0 &&
                            _getEventsForDay(_selectedDay).first.journal != null
                        ? _getEventsForDay(_selectedDay).first.journal as String
                        : 'Ikke udfyldt for denne dato',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Dine intentioner",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(6, 0, 6, 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _getEventsForDay(_selectedDay).length > 0 &&
                          _getEventsForDay(_selectedDay).first.intentions !=
                              null
                      ? intentionLayout()
                      : Container(
                          margin: EdgeInsets.fromLTRB(14, 0, 6, 10),
                          child: Text('Ikke udfyldt for denne dato')),
                ),
              ),
              //Text("Get selected day: " + _selectedDay.toString()),
              //Text("Current day?: " + isCurrentDaySelected.toString()),
              SizedBox(height: 60), // Add some space
            ],
          ),
        ),
      );
    }
  }

  Widget intentionLayout() {
    JournalEvent event = _getEventsForDay(_selectedDay).first;
    List<String> intentions = event.intentions!
        .split(';#')
        .where((element) => element != '')
        .toList();

    List<bool> checked = event.intentionsChecked;
    intentionCb = checked;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: intentions.length,
            itemBuilder: (context, index) {
              String intention = intentions[index];
              return CheckboxListTile(
                title: Text(intention),
                onChanged: (bool? value) {
                  setState(() {
                    intentionCb[index] = value!;
                  });
                  jc.saveChecked(intentionCb, event.entry_ID!);
                },
                value: intentionCb[index],
                visualDensity: const VisualDensity(vertical: -2.0),
                activeColor: Constants.kGreenColor,
              );
            })
      ],
    );
  }

  Widget floatingButtons() {
    bool isCurrentDaySelected = isSameDay(today, DateTime.now());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: isCurrentDaySelected
              ? () {
                  var selected = _getEventsForDay(_selectedDay);
                  if (selected.isNotEmpty && selected.first.journal != null) {
                    _journalController.text = selected.first.journal as String;
                  }
                  debugPrint("Pressed");
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Tilføj dagbogsnotat for i dag'),
                      content: TextFormField(
                        autofocus: true,
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
                              color: Constants.kBlackColor, // Text color
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
                            'Gem',
                            style: TextStyle(
                              color: Constants.kBlackColor, // Text color
                              fontSize: 16.0, // Font size
                              // Add more styles as needed
                            ),
                          ),
                          onPressed: () {
                            if (_journalController.text.isEmpty) {
                              _journalController.clear();
                              Navigator.pop(context);
                              return;
                            } else {
                              int? entry_id =
                                  _getEventsForDay(_selectedDay).isNotEmpty
                                      ? _getEventsForDay(_selectedDay)
                                          .first
                                          .entry_ID
                                      : null;
                              String content = _journalController.text;
                              print('pressed: $entry_id');
                              print('Activity content: $content');
                              if (entry_id == null) {
                                print('new entry');
                                jc.saveEntry(_selectedDay).then((id) => {
                                      print('adding activity'),
                                      jc
                                          .saveActivity(id, content)
                                          .then((value) => refreshData())
                                    });
                              } else {
                                print('updating activity');
                                jc
                                    .saveActivity(entry_id, content)
                                    .then((value) => refreshData());
                              }

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
          child: Row(
            children: [
              Icon(Icons.edit_note_outlined,
                  color: isCurrentDaySelected
                      ? Constants.kBlackColor // Text color when enabled
                      : Constants.kGreyColor),
              Text(
                "Dagbog",
                style: TextStyle(
                  color: isCurrentDaySelected
                      ? Constants.kBlackColor // Text color when enabled
                      : Constants.kGreyColor, // Text color when disabled
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: isCurrentDaySelected
              ? () {
                  List<JournalEvent> selected = _getEventsForDay(_selectedDay);

                  List<TextEditingController> intentionsController = [
                    _intentionController1,
                    _intentionController2,
                    _intentionController3
                  ];
                  List<String>? intentions = selected.isNotEmpty
                      ? selected.first.intentions?.split(';#')
                      : null;

                  if (intentions != null) {
                    for (var i = 0; i < intentionsController.length; i++) {
                      TextEditingController c = intentionsController[i];

                      c.text = intentions[i];
                    }
                  }

                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Tilføj intentioner for i dag'),
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextFormField(
                              autofocus: true,
                              controller: _intentionController1,
                              maxLines: 1,
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
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText: 'Skriv din anden intention her... ✏️',
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
                              maxLines: 1,
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
                            //Knap til intentioner
                            'Gem',
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
                              int? entry_id =
                                  _getEventsForDay(_selectedDay).isNotEmpty
                                      ? _getEventsForDay(_selectedDay)
                                          .first
                                          .entry_ID
                                      : null;
                              String content = [
                                _intentionController1.text,
                                _intentionController2.text,
                                _intentionController3.text
                              ].join(';#');
                              print('pressed: $entry_id');
                              print('content: $content');
                              if (entry_id == null) {
                                print('new entry');
                                jc.saveEntry(_selectedDay).then((id) => jc
                                    .saveIntentions(id, content)
                                    .then((value) => refreshData()));
                              } else {
                                print('updating intention');
                                jc
                                    .saveIntentions(entry_id, content)
                                    .then((value) => refreshData());
                              }
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
          child: Row(
            children: [
              Icon(Icons.edit_note_outlined,
                  color: isCurrentDaySelected
                      ? Constants.kBlackColor // Text color when enabled
                      : Constants.kGreyColor),
              Text(
                "Intentioner",
                style: TextStyle(
                  color: isCurrentDaySelected
                      ? Constants.kBlackColor // Text color when enabled
                      : Constants.kGreyColor, // Text color when disabled
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


