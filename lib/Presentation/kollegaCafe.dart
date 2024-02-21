import 'package:compassion_app/Presentation/Components/borderCard.dart';
import 'package:compassion_app/Presentation/Components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KollegaCafe extends StatelessWidget {
  const KollegaCafe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KollegaCafe'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(25, 20, 25, 15),
                child: const Text(
                  'Velkommen til Kollegacafé, her finder du information og viden fra tidligere Kollegacaféer, samt linket til fremtidige møder.',
                  style: TextStyle(
                    color: Constants.kBlackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              borderCard(
                title: "Link til KollegaCafe",
                iconData: Icons.coffee_rounded,
                underline: true,
                onTap: () {
                  debugPrint("Tabbed: Dagbog genvej");
                },
                trailingIconData: CupertinoIcons.chevron_forward,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 20, 25, 15),
                child: const Text(
                  'Videoer fra tidligere møder',
                  style: TextStyle(
                    color: Constants.kBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
