class EventSearchRequestModel {
  int page;
  String query;

  EventSearchRequestModel({required this.page, required this.query});

  Map<String, dynamic> toJson() => {"page": page, "q": query};
}
