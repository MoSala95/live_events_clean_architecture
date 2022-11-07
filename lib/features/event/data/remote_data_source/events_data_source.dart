import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:live_events_clean_architecture/core/utils/print.dart';
import 'package:live_events_clean_architecture/features/event/data/models/request/event_request_search_model.dart';
import 'package:live_events_clean_architecture/features/event/data/models/response/events_response_model.dart';
import 'package:live_events_clean_architecture/features/event/data/remote_data_source/abstract_events_data_source.dart';
import 'package:live_events_clean_architecture/features/event/data/transormers/event_transformer.dart';
import 'package:live_events_clean_architecture/features/event/domain/entities/event_entity.dart';

import '../../../../config/app_services/settings_service.dart';
import '../../../../core/networking/api/api_client.dart';
import '../../../../core/networking/api/api_consumer.dart';
import '../../../../core/networking/api/end_points.dart';
import '../../../../core/networking/error/exceptions.dart';
import '../../../../core/networking/error/failures.dart';

class EventsRemoteDataSourceImp extends AbstractEventsRemoteDateSource {
  final ApiConsumer _apiConsumer = Get.find<ApiConsumer>();

  EventTransformer eventTransformer = EventTransformer();

  final settingService = Get.find<SettingsService>();

  @override
  Future<Either<Failure, EventEntity>> getEventsPerPage(
      {required int page}) async {
    try {
      final response = await ApiClient.callApiAndHandleResponse(
        () =>
            _apiConsumer.get(EndPoints.baseUrl, quaryparam: {"page": "$page"}),
      );

      if (response == null) {
        return Left(ServerFailure("error get the data"));
      } else {
        final eventsResponse = EventsResponse.fromJson(response);
        EventEntity eventEntity =
            eventTransformer.transformToEntityModel(eventsResponse);

        return Right(eventEntity);
      }
    } catch (error, stacktrace) {
      ePrint("stacktrace: $stacktrace");
      if (error is ServerException) {
        return Left(ServerFailure(error.message, stacktrace.toString()));
      }

      return Left(ServerFailure(error.toString(), stacktrace.toString()));
    }
  }

  @override
  Future<Either<Failure, EventEntity>> getSearchedEvents(
      {required EventSearchRequestModel searchRequestModel}) async {
    try {
      final response = await ApiClient.callApiAndHandleResponse(
        () => _apiConsumer.get(EndPoints.baseUrl,
            quaryparam: searchRequestModel.toJson()),
      );

      if (response == null) {
        return Left(ServerFailure("error get the data"));
      } else {
        dPrint(response.toString());
        final eventsResponse = EventsResponse.fromJson(response);
        EventEntity eventEntity =
            eventTransformer.transformToEntityModel(eventsResponse);

        return Right(eventEntity);
      }
    } catch (error, stacktrace) {
      ePrint("stacktrace: $stacktrace");
      if (error is ServerException) {
        return Left(ServerFailure(error.message, stacktrace.toString()));
      }

      return Left(ServerFailure(error.toString(), stacktrace.toString()));
    }
  }
}
