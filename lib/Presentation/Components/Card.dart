import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/Presentation/Components/constants.dart';
import '/Presentation/just_a_class.dart';

class CardWidget extends StatelessWidget {
  // CardWidget({Key? key}) : super(key: key);

  final String title;
  final double titleSize;
  final String subtitle;
  final String iconPath;
  final VoidCallback onTap;

  const CardWidget({
    super.key,
    required this.title,
    required this.titleSize,
    required this.subtitle,
    required this.iconPath,
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
            elevation: 4,
            color: Constants.cardColor,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                      padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                      child: SvgPicture.asset('assets/icons/$iconPath')),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            title,
                            style: TextStyle(
                                fontSize: titleSize,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
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
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Constants.sduGoldColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(11.0),
                        bottomRight: Radius.circular(11.0),
                      ),
                    ),
                    child: Icon(
                      CupertinoIcons.chevron_forward,
                      size: 48,
                      color: Constants.sduWhiteColor,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
