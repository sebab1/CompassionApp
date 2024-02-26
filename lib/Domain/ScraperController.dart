import 'dart:developer';

import 'package:chaleno/chaleno.dart';
import 'package:compassion_app/Domain/Content.dart';
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
      List<Result>? para = element.querySelectorAll('p');
      String? src = element.querySelector('iframe')?.src;

      List<Content> data = [];
      for (var element in para!) {
        var currentElement = element.innerHTML;
        List<Result>? anchor = element.querySelectorAll('a');
        print('p: $currentElement');
        anchor!.forEach((element) {
          var anchorElement = element.html;
          print('a: $anchorElement');
        });

        Content content = Content(currentElement, element.href);
        //print(content.toString());
        data.add(content);
      }
      String? trimTitle = title!.trim();
      Event event = Event(trimTitle, data, src);

      events.add(event);
    });

    return events;
  }
}
