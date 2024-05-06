import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import './constants.dart';

class borderCard extends StatelessWidget {

  final String title;
  final double? titleSize;
  //final IconData iconData;
  final VoidCallback onTap;
  final String iconPath;
  final IconData? trailingIconData;
  final bool underline;

  const borderCard(
      {super.key,
      required this.underline,
      required this.title,
      this.titleSize,
      //required this.iconData,
      required this.iconPath,
      required this.onTap,
      this.trailingIconData // Make trailing icon optional
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 76,
        margin: EdgeInsets.fromLTRB(20, 4, 20, 4),
        child: Card(
          elevation: 4,
          color: Constants.cardColor,
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
                  leading: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                    child: SvgPicture.asset(
                      'assets/icons/$iconPath',
                      height: 50,
                      width: 50,
                    ),
                  ),
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 0, 6),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: titleSize,
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
