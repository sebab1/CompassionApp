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
    double totalWidth = 350; // Set the height of the leading section

    return Container(
      height: totalHeight,
      width: totalWidth,

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11.0),
        ),
        elevation: 10,
        color: Constants.kWhiteColor,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Container(
            width: 50,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Icon(CupertinoIcons.arrow_up_left_arrow_down_right, size: 60,),
          ),
          Container(
            //padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
            //margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            //margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Align(
              //alignment: Alignment.center,
              child: Container(
                //padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        child: Text("title",
                          style: TextStyle(fontSize: 35),
                          textAlign: TextAlign.left,)
                    ),
                    Container(
                      width: 200,
                      child: Text("Subtitle sdn snoldwjdj wjw fndwn iwn iwni nidni nwi n",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              )
            ),
          ),
          Container(
            width: 50,
            child: Icon(CupertinoIcons.arrow_up_left_arrow_down_right),
            decoration: BoxDecoration(
              color: Constants.kCyanColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(11.0),
                bottomRight: Radius.circular(11.0),
              ),
            ),
          )
        ],
        ),
      )
    );
  }
}

// Placeholder for the Proces class
class Proces {
  final int proces_id;
  final String date;

  Proces({required this.proces_id, required this.date});
}
