
import '../../data/models/response/events_response_model.dart';

class EventEntity{
  EventEntity({
    required this.events,
    required this.meta,
  });

  List<Event> events;
  Meta meta;
}