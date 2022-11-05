import 'package:live_events_clean_architecture/core/base_models/transformer_abstract.dart';
import 'package:live_events_clean_architecture/features/event/data/models/response/events_response_model.dart';

import 'package:live_events_clean_architecture/features/event/domain/entities/event_entity.dart';

class EventTransformer extends TransformerAbstract<EventsResponse, EventEntity> {
  @override
  EventsResponse transformToDataModel(EventEntity domain) {
    // TODO: implement transformToDataModel
    return EventsResponse(events: domain.events, meta: domain.meta);
  }

  @override
  List<EventEntity> transformToEntityList(List<EventsResponse> dataModels) {
    // TODO: implement transformToEntityList
    throw UnimplementedError();
  }

  @override
  EventEntity transformToEntityModel(EventsResponse dataModel) {
    // TODO: implement transformToEntityModel
    return EventEntity(events: dataModel.events, meta: dataModel.meta);

  }
}

