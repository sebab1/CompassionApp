import 'package:compassion_app/Domain/Event.dart';

abstract class IScraperController {
  List<Event> getEvents();
}
