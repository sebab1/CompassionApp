import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './constants.dart';

class littleCard extends StatelessWidget {
  //const littleCard({super.key});

  final String title;
  final IconData iconData;
  final VoidCallback onTap;
  final double titleSize;

  const littleCard({super.key,
    required this.title,
    required this.iconData,
    required this.onTap,
    required this.titleSize,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 85,
        width: 394,
        //margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Card(
          color: Constants.sduGreyColor,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          elevation: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Icon(
                  iconData,
                  size: 60,
                ),
              ),
              Container(
                child: Text(
                  title,
                  style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Icon(
                  CupertinoIcons.chevron_forward,
                  color: Constants.sduGoldColor,
                  size: 40,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
