import 'dart:developer';

import 'package:chaleno/chaleno.dart';
import 'package:compassion_app/Domain/Event.dart';
import 'package:compassion_app/Domain/Controllers/IScraperController.dart';

class ScraperController implements IScraperController{
  late final Chaleno _chaleno;
  
  ScraperController(this._chaleno);

  Future<List<Event>> getEvents() async {
    final scraper = await _chaleno.load(
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
