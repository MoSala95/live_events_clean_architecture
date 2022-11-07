import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:live_events_clean_architecture/core/base_models/use_case.dart';
import 'package:live_events_clean_architecture/features/event/data/models/request/event_request_search_model.dart';
import 'package:live_events_clean_architecture/features/event/data/repository/events_repository_imp.dart';
import 'package:live_events_clean_architecture/features/event/domain/entities/event_entity.dart';
import 'package:live_events_clean_architecture/features/event/domain/repository/events_repository.dart';

import '../../../../core/networking/error/failures.dart';

class EventsPerPageUseCase implements UseCase<EventEntity, int> {
  AbstractEventsRepository eventsRepositoryRepository =
      Get.put<AbstractEventsRepository>(EventsRepositoryImp());

  @override
  Future<Either<Failure, EventEntity>> call(int page) {
    return eventsRepositoryRepository.getEventsPerPage(page: page);
  }
}

class EventsSearchUseCase
    implements UseCase<EventEntity, EventSearchRequestModel> {
  AbstractEventsRepository eventsRepositoryRepository =
      Get.put<AbstractEventsRepository>(EventsRepositoryImp());

  @override
  Future<Either<Failure, EventEntity>> call(
      EventSearchRequestModel searchRequestModel) {
    return eventsRepositoryRepository.getSearchedEvents(
        searchRequestModel: searchRequestModel);
  }
}
