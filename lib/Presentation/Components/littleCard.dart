import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import './constants.dart';

class littleCard extends StatelessWidget {
  //const littleCard({super.key});

  final String title;
  final IconData? iconData;
  final VoidCallback onTap;
  final double titleSize;
  final String? customIcon;

  const littleCard({
    super.key,
    required this.title,
    this.iconData,
    required this.onTap,
    required this.titleSize,
    this.customIcon,
  });

  Widget iconContainer(IconData? icon) {
    if (iconData != null) {
      return Container(
        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
        child: Icon(
          iconData,
          size: 60,
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
        child: SvgPicture.asset(
          'assets/icons/$customIcon',
          width: 60,
          height: 60,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
              iconContainer(iconData),
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
                          //fontWeight: FontWeight.bold
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
