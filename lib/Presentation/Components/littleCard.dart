import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './constants.dart';

class littleCard extends StatelessWidget {
  const littleCard({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 85,
      child: Card(
        color: Constants.sduGreyColor,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        elevation: 8,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
            child: Icon(
              Icons.watch_later_outlined,
              size: 60,
            ),
          ),
          Container(
            child: Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: Icon(
              CupertinoIcons.chevron_forward,
              color: Constants.sduGoldColor,
              size: 40,
            ),
          )
        ]),
      ),
    );
  }
}
