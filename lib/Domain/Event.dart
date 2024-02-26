import 'package:compassion_app/Domain/Content.dart';

class Event {
  String? title;
  List<Content> description;
  String? video_link;

  Event(this.title, this.description, this.video_link);
}
