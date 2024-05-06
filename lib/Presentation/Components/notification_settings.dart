import 'package:compassion_app/Domain/Controllers/INotificationController.dart';
import 'package:compassion_app/Domain/NotificationController.dart';
import 'package:compassion_app/Presentation/Components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wheel_picker/wheel_picker.dart';

class NotificationSettings extends StatefulWidget {
  final INotificationController notificationController;
  const NotificationSettings({super.key, required this.notificationController});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  late SharedPreferences sharedPreferences;

  bool switchOn = false;
  late INotificationController nc;

  late int? hours;
  late int? minutes;
  late bool isEdited = false;

  final now = TimeOfDay.now();
  late final hoursWheel = WheelPickerController(
    itemCount: 24,
    initialIndex: hours ?? now.hour % 12,
  );
  late final minutesWheel = WheelPickerController(
    itemCount: 60,
    initialIndex: minutes ?? now.minute,
  );

  Future updateWheelPickerState(int hours, int minutes) {
    return Future.wait([
      sharedPreferences.setInt('hours', hours),
      sharedPreferences.setInt('minutes', minutes)
    ]);
  }

  Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    hours = setWheelPickerState('hours');
    minutes = setWheelPickerState('minutes');
  }

  bool? switchState() {
    return sharedPreferences.getBool('switchState');
  }

  int? setWheelPickerState(String time) {
    return sharedPreferences.getInt(time);
  }

  Future updateSwitchState(bool value) {
    return sharedPreferences.setBool('switchState', value);
  }

  bool updateIsEdit(int indexHours, int indexMinutes) {
    return hours != indexHours || minutes != indexMinutes;
  }

  @override
  void initState() {
    init().then((value) => setState(() {
          switchOn = switchState() ?? false;
        }));

    nc = widget.notificationController;
    nc.initialize();
  }

  @override
  void dispose() {
    hoursWheel.dispose();
    minutesWheel.dispose();
    super.dispose();
  }

  showSnackBar(context) {
    SnackBar snackBar = SnackBar(
      content: const Text('Din daglige påmindelse er gemt',
          style: TextStyle(fontSize: 20, color: Constants.kBlackColor)),
      backgroundColor: Constants.kWhiteColor,
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height / 1.3,
          left: 10,
          right: 10),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 26.0, height: 1.5);
    final wheelStyle = WheelPickerStyle(
      size: 110,
      itemExtent: textStyle.fontSize! * textStyle.height!, // Text height
      squeeze: 1.2,
      diameterRatio: 0.7,
      surroundingOpacity: .25,
      magnification: 1.2,
    );

    Widget itemBuilder(BuildContext context, int index) {
      return Text("$index".padLeft(2, '0'), style: textStyle);
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Daglig påmindelse',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Icon(switchOn
                    ? Icons.notifications_active_outlined
                    : Icons.notifications_off_outlined),
                Container(
                  padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                ),
                Switch(
                    activeColor: Constants.sduGoldColor,
                    value: switchOn,
                    onChanged: (bool value) async {
                      if (!value) {
                        await nc.cancelAllNotification();
                      }
                      updateSwitchState(value);
                      setState(() {
                        switchOn = value;
                      });
                    }),
              ],
            ),
          ],
        ),
        if (switchOn)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WheelPicker(
                    onIndexChanged: (value) {
                      setState(() {
                        isEdited = hours != value;
                      });
                    },
                    builder: itemBuilder,
                    controller: hoursWheel,
                    looping: false,
                    style: wheelStyle,
                    selectedIndexColor: Constants.kBlackColor,
                  ),
                  const Text(":", style: textStyle),
                  WheelPicker(
                    onIndexChanged: (value) {
                      setState(() {
                        isEdited = minutes != value;
                      });
                    },
                    builder: itemBuilder,
                    controller: minutesWheel,
                    style: wheelStyle,
                    enableTap: true,
                    selectedIndexColor: Constants.kBlackColor,
                  ),
                ],
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: isEdited
                        ? MaterialStatePropertyAll<Color>(
                            Constants.sduGoldColor)
                        : MaterialStatePropertyAll<Color>(
                            Constants.kGreyColor)),
                onPressed: isEdited
                    ? () async {
                        int selectedHours = hoursWheel.selected;
                        int selectedMinutes = minutesWheel.selected;
                        await nc
                            .recurringNotification(
                                title: 'Daglig påmindelse',
                                body:
                                    'Trænger du til at afstresse med meditation eller at skrive et dagbogsnotat?',
                                payload: '123.ab',
                                hour: selectedHours,
                                minutes: selectedMinutes)
                            .then((value) => updateWheelPickerState(
                                    selectedHours, selectedMinutes)
                                .then((value) => {
                                      hours = selectedHours,
                                      minutes = selectedMinutes,
                                      showSnackBar(context)
                                    }));
                        setState(() {
                          isEdited =
                              updateIsEdit(selectedHours, selectedMinutes);
                        });
                      }
                    : null,
                child: Text(
                  'Gem',
                  style: TextStyle(color: Constants.kBlackColor),
                ),
              )
            ],
          ),
      ],
    );
  }
}
