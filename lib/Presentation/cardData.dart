import 'package:flutter/material.dart';

class CardData {
  String title;
  String desc;
  String audioPath;
  IconData? icon;
  String? customIcon;

  CardData(this.title, this.desc, this.audioPath, this.icon, this.customIcon);
}
