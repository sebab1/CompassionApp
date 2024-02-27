import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './constants.dart';

class littleCard extends StatelessWidget {
  //const littleCard({super.key});

  final String title;
  final IconData iconData;
  final VoidCallback onTap;
  final double titleSize;

  const littleCard({
    super.key,
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
        height: 86,
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Card(
          color: Constants.sduGreyColor,
          elevation: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                child: Icon(
                  iconData,
                  size: 60,
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      title,
                      textAlign: TextAlign.center, // Center align the text
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: TextStyle(
                          fontSize: titleSize, fontWeight: FontWeight.bold),
                    ),
                  ),
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
