import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './constants.dart';

class borderCard extends StatelessWidget {
  //const littleCard({super.key});

  final String title;
  final IconData iconData;
  final VoidCallback onTap;
  final IconData? trailingIconData;
  final bool underline;

  const borderCard(
      {super.key,
      required this.underline,
      required this.title,
      required this.iconData,
      required this.onTap,
      this.trailingIconData // Make trailing icon optional
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 72,
        width: 394,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Card(
          shape: Border(
            top: BorderSide(color: Constants.sduGoldColor, width: 10),
          ),
          color: Constants.sduGreyColor,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          elevation: 4,
          child: ListTile(
            leading: Icon(
              iconData,
              size: 50,
              color: Constants.kBlackColor,
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    EdgeInsets.only(left: 16), // Adjust the left padding here
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: underline ? TextDecoration.underline : null),
                ),
              ),
            ),
            trailing: trailingIconData != null
                ? Padding(
                    padding: EdgeInsets.only(top: 6), // Adjust top padding here
                    child: Icon(
                      trailingIconData,
                      color: Constants.sduGoldColor,
                      size: 36,
                    ),
                  )
                : null, // Use null instead of Container
          ),
        ),
      ),
    );
  }
}
