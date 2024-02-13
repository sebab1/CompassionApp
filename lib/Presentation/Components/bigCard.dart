import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function(String) onTap;

  BigCard({required this.title, required this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Set the width of the card
      height: 150, // Set the height of the card
      child: Card(
        margin: EdgeInsets.fromLTRB(26, 16, 26, 0),
        elevation: 10,
        shape: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 8)),
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 10),
          leading: Icon(Icons.calendar_month_outlined, size: 48.0),
          title: Text(
            'FAM',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Test",
          ),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Handle onTap event
          },
        ),
      ),
    );
  }
}
