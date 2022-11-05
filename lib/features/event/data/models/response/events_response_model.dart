// To parse this JSON data, do
//
//     final eventsResponse = eventsResponseFromJson(jsonString);

import 'dart:convert';

EventsResponse eventsResponseFromJson(String str) =>
    EventsResponse.fromJson(json.decode(str));

class EventsResponse {
  EventsResponse({
    required this.events,
    required this.meta,
  });

  List<Event> events;
  Meta meta;

  factory EventsResponse.fromJson(Map<String, dynamic> json) => EventsResponse(
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );
}

class Event {
  Event(
      {required this.id,
      required this.datetimeUtc,
      required this.isOpen,
      required this.title,
      required this.description});

  int id;
  DateTime datetimeUtc;
  bool isOpen;

  String title;
  String description;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        datetimeUtc: DateTime.parse(json["datetime_utc"]),
        isOpen: json["is_open"],
        title: json["title"],
        description: json["description"],
      );
}

class Meta {
  Meta({
    required this.total,
    required this.took,
    required this.page,
    required this.perPage,
  });

  int total;
  int took;
  int page;
  int perPage;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        total: json["total"],
        took: json["took"],
        page: json["page"],
        perPage: json["per_page"],
      );
}
