import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:live_events_clean_architecture/features/event/data/models/request/event_request_search_model.dart';
import 'package:live_events_clean_architecture/features/event/data/remote_data_source/abstract_events_data_source.dart';
import 'package:live_events_clean_architecture/features/event/data/remote_data_source/events_data_source.dart';
import 'package:live_events_clean_architecture/features/event/domain/entities/event_entity.dart';
import 'package:live_events_clean_architecture/features/event/domain/repository/events_repository.dart';

import '../../../../core/networking/error/failures.dart';

class EventsRepositoryImp extends AbstractEventsRepository {
  var remoteSource =
      Get.put<AbstractEventsRemoteDateSource>(EventsRemoteDataSourceImp());

  @override
  Future<Either<Failure, EventEntity>> getEventsPerPage({required int page}) {
    return remoteSource.getEventsPerPage(page: page);
  }

  @override
  Future<Either<Failure, EventEntity>> getSearchedEvents(
      {required EventSearchRequestModel searchRequestModel}) {
    // TODO: implement getSearchedEvents
    return remoteSource.getSearchedEvents(
        searchRequestModel: searchRequestModel);
  }
}
