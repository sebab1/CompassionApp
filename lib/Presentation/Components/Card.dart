import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/Presentation/Components/constants.dart';
import '/Presentation/just_a_class.dart';

class CardWidget extends StatelessWidget {
  //CardWidget({Key? key}) : super(key: key);

  final String title;
  final double titleSize;
  final String subtitle;
  final IconData iconData;
  final VoidCallback onTap;

  const CardWidget({super.key,
    required this.title,
    required this.titleSize,
    required this.subtitle,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 130,
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.0),
          ),
          elevation: 7,
          color: Constants.sduGreyColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 50,
                margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                child: Icon(
                iconData,
                size: 60,
                ),
              ),
              Container(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                    children: [
                      Container(
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: titleSize, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                        width: 200,
                        child: Text(
                          subtitle,
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
