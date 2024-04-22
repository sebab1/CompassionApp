import 'package:compassion_app/Domain/notification_api.dart';
import 'package:compassion_app/Presentation/Components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wheel_picker/wheel_picker.dart';

class NotificationSettings extends StatefulWidget {
  final NotificationApi notificationApi;
  const NotificationSettings({super.key, required this.notificationApi});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {


  bool switchOn = false;
  late NotificationApi notificationApi;

  final now = TimeOfDay.now();
  late final hoursWheel = WheelPickerController(
    itemCount: 13,
    initialIndex: now.hour % 12,
  );
  late final minutesWheel = WheelPickerController(
    itemCount: 60,
    initialIndex: now.minute,
  );

  @override
  void initState() {
    // TODO: implement initState
    notificationApi = widget.notificationApi;
  }
  showSnackBar(context) {
    SnackBar snackBar = SnackBar(
      content: const Text('Din daglig påmindelse er gemt',
          style: TextStyle(fontSize: 20)),
      backgroundColor: Constants.sduRedColor,
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
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
                    ? Icons.notifications_active
                    : Icons.notifications),
                    Container(padding: EdgeInsets.fromLTRB(4, 0, 0, 0),),
                Switch(
                    activeColor: Constants.sduGoldColor,
                    value: switchOn,
                    onChanged: (bool value) async {
                      if(!value){
                        print('cancel notification');
                        await notificationApi.cancelAllNotification();
                      }
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
                    builder: itemBuilder,
                    controller: hoursWheel,
                    looping: false,
                    style: wheelStyle,
                    selectedIndexColor: Constants.kBlackColor,
                  ),
                  const Text(":", style: textStyle),
                  WheelPicker(
                    builder: itemBuilder,
                    controller: minutesWheel,
                    style: wheelStyle,
                    enableTap: true,
                    selectedIndexColor: Constants.kBlackColor,
                  ),
                ],
              ),
              ElevatedButton(
                style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Constants.sduGoldColor)),
                onPressed: (
                ) async {

                  await notificationApi.recurringNotification(title: 'Compassion App', body: 'Måske trænger du til tid til afstresning med en at skrive i din dagbog eller meditation.', payload: '123.ab', hour: hoursWheel.selected, minutes: minutesWheel.selected).
                  then((value) => showSnackBar(context));

                },
                child: Text('Gem', style: TextStyle(color: Constants.kBlackColor),),
              )
            ],
          ),
      ],
    );
  }
}
