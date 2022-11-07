import 'package:dartz/dartz.dart';
import 'package:live_events_clean_architecture/features/event/data/models/request/event_request_search_model.dart';
import 'package:live_events_clean_architecture/features/event/domain/entities/event_entity.dart';

import '../../../../core/networking/error/failures.dart';

abstract class AbstractEventsRemoteDateSource {
  Future<Either<Failure, EventEntity>> getEventsPerPage({
    required int page,
  });
  Future<Either<Failure, EventEntity>> getSearchedEvents({
    required EventSearchRequestModel searchRequestModel,
  });
}
