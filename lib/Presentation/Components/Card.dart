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
    double totalHeight = 140; // Set the total height of the card
    double totalWidth = 376; // Set the height of the leading section

    return GestureDetector(
      onTap: () {
        debugPrint("Tabbed card"); // Handle onTap event
      },
      child: Container(
        height: totalHeight,
        width: totalWidth,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.0),
          ),
          elevation: 10,
          color: Constants.sduGreyColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 50,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Icon(CupertinoIcons.arrow_up_left_arrow_down_right, size: 60,),
              ),
              Container(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                    children: [
                      Container(
                        child: Text(
                          "title",
                          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                        width: 200,
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Constants.kBlackColor),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 50,
                child: Icon(
                  CupertinoIcons.chevron_forward,
                  size: 48,
                  color: Constants.sduWhiteColor,
                ),
                decoration: BoxDecoration(
                  color: Constants.sduGoldColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(11.0),
                    bottomRight: Radius.circular(11.0),
                  ),
                ),
              ),
            ],
          ),
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
