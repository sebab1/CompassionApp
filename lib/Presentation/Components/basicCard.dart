import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './constants.dart';

class BasicCard extends StatelessWidget {
  final String title;
  final IconData? iconData;
  final VoidCallback onTap;
  final double titleSize;
  final double? iconSize; // Make iconSize optional

  const BasicCard({
    Key? key,
    required this.title,
    this.iconData,
    required this.onTap,
    required this.titleSize,
    this.iconSize, // Declare iconSize as optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Card(
          color: Constants.cardColor,
          elevation: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (iconData != null) // Check if the icon is provided
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Icon(
                    iconData,
                    size: iconSize ?? 60, // Use iconSize if provided, otherwise default to 60
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
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: titleSize,
                      ),
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
