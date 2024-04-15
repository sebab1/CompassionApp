import 'package:compassion_app/Domain/Event.dart';

abstract class IScraperController {
  Future<List<Event>> getEvents();
}
