import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './constants.dart';

class borderCard extends StatelessWidget {

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
        height: 76,
        margin: EdgeInsets.fromLTRB(20, 6, 20, 6),
        child: Card(
          color: Constants.sduGreyColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: Constants.sduGoldColor, width: 10),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    iconData,
                    size: 50,
                    color: Constants.kBlackColor,
                  ),
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 0, 6),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          decoration:
                              underline ? TextDecoration.underline : null,
                        ),
                      ),
                    ),
                  ),
                  trailing: trailingIconData != null
                      ? Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Icon(
                            trailingIconData,
                            color: Constants.sduGoldColor,
                            size: 36,
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
