import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/Presentation/Components/constants.dart';
import '/Presentation/just_a_class.dart';

class CardWidget extends StatefulWidget {
  CardWidget({Key? key}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {

  List<Proces> _getSampleData() {
    // Replace this with your actual data or use a generator function
    return List.generate(
      10,
          (index) => Proces(
        proces_id: index,
        date: DateTime.now().toString(),
        // Add other properties as needed
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400, // Set the width of the card
      height: 150, // Set the height of the card
      child: Card(
        margin: EdgeInsets.fromLTRB(26, 16, 26, 0),
        elevation: 10,
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(16, 16, 0, 10),
          leading: Icon(Icons.calendar_month_outlined, size: 72.0),
          title: Text(
            'FAM',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Test",
          ),
          trailing: Container(
            height: 50,
            width: 50,
            color: Constants.sduGoldColor,
            padding: EdgeInsets.zero,
            child: Icon(
              CupertinoIcons.arrow_right_to_line,
              color: Constants.kBlackColor,
            ),
          ),

          onTap: () {
            // Handle onTap event
          },
        ),
      ),
    );
  }
}

// Placeholder for the Proces class
class Proces {
  final int proces_id;
  final String date;

  Proces({required this.proces_id, required this.date});
}
