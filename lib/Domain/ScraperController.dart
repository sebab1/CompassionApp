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
      List<Result>? para = element.querySelectorAll('p');
      String? src = element.querySelector('iframe')?.src;

      List<String?> content = [];

      for (var element in para!) {
        content.add(element.text);
      }
      Event event = Event(title, content, src);

      events.add(event);

    });

    return events;
  }
}
