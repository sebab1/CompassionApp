import 'dart:developer';

import 'package:chaleno/chaleno.dart';
import 'package:compassion_app/Domain/Event.dart';
import 'package:compassion_app/Domain/IScraperController.dart';

class ScraperController {
  Future<List<Event>> initScraper() async {
    final scraper = await Chaleno().load(
        'https://www.sdu.dk/da/forskning/center_for_compassion/kollegacafe/materiale');

    List<Result> result = scraper!.getElementsByClassName('accordion__item');

    List<Event> events = [];

    result.forEach((element) {
      String? title = element.querySelector('.accordion-header__title')!.text;

      String? trimTitle = title!.trim();
      Event event = Event(trimTitle, element.html);

      events.add(event);
    });

    return events;
  }
}
