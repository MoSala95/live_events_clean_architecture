import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_events_clean_architecture/config/app_services/locale_storage/app_storage_keys.dart';
import 'package:live_events_clean_architecture/config/app_services/locale_storage/storage_service.dart';
import 'package:live_events_clean_architecture/core/getx_base_controller/base_controller.dart';
import 'package:live_events_clean_architecture/core/utils/print.dart';
import 'package:live_events_clean_architecture/features/event/data/models/request/event_request_search_model.dart';
import 'package:live_events_clean_architecture/features/event/data/models/response/events_response_model.dart';
import 'package:live_events_clean_architecture/features/event/data/repository/events_repository_imp.dart';
import 'package:live_events_clean_architecture/features/event/domain/entities/event_entity.dart';
import 'package:live_events_clean_architecture/features/event/domain/repository/events_repository.dart';
import 'package:live_events_clean_architecture/features/event/domain/use_cases/events_use_case.dart';

import '../../../../config/app_services/settings_service.dart';
import '../../../../core/utils/enums/app_enum.dart';

class MainEventsController extends BaseController {
  final eventsRepository =
      Get.put<AbstractEventsRepository>(EventsRepositoryImp());
  final eventPerPageUseCase = Get.put(EventsPerPageUseCase());

  final eventSearchUseCase = Get.put(EventsSearchUseCase());

  final storageService = Get.find<StorageService>();

  final settingService = Get.find<SettingsService>();

  EventEntity? eventEntity;
  List<Event> events = [];
  Timer? timer;

  ScrollController scrollController = ScrollController();
  final TextEditingController searchTextController = TextEditingController();
  int currentResultPage = 1;
  int? lastResultPage;
  late FocusNode focusNode;

  //AppStorage appStorage= AppStorage();

  List<int> favoriteList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    focusNode = FocusNode();
    readUserLikes();
    getEvents();
    loadMoreEvents();
    super.onInit();
  }

  void loadMoreEvents() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
              scrollController.position.pixels &&
          currentResultPage <= lastResultPage!) {
        print("load more searched events");
        if (searchTextController.value.text.isNotEmpty) {
          await searchEvents(value: searchTextController.value.text);
        } else {
          getEvents();
        }
      }
    });
  }

  Future<void> getEvents() async {
    updateState = LoadingState.waiting;

    update();

    final result = await eventPerPageUseCase.call(currentResultPage);
    result.fold((l) {
      updateState = LoadingState.error;
      update();
    }, (eventsEntity) {
      dPrint("success get events");
      handleSuccessResponse(entity: eventsEntity);
    });
  }

  Future<void> handleNewSearch({required String value}) async {
    if (timer != null) timer!.cancel();

    timer = Timer(const Duration(seconds: 1), () async {
      if (value.isNotEmpty) {
        events.clear();
        currentResultPage = 1;
        await searchEvents(value: value);
      }
    });
  }

  Future<void> searchEvents({required String value}) async {
    updateState = LoadingState.waiting;
    update();

    final searchRequestModel =
        EventSearchRequestModel(page: currentResultPage, query: value);
    final result = await eventSearchUseCase.call(searchRequestModel);
    result.fold((l) {
      updateState = LoadingState.error;
      update();
    }, (eventEntity) {
      debugPrint("searched events success");
      handleSuccessResponse(entity: eventEntity);
    });
  }

  handleSuccessResponse({required EventEntity entity}) {
    events.addAll(entity.events);
    updateState = events.isEmpty ? LoadingState.empty : LoadingState.done;

    lastResultPage = entity.meta.total;
    if (currentResultPage <= lastResultPage!) {
      currentResultPage++;
    }
    update();
  }

  void cancelSearch() {
    searchTextController.clear();
    focusNode.unfocus();
    events.clear();
    currentResultPage = 1;
    getEvents();
  }

  Future<void> saveUserLikes() async {
    // await readUserLikes();
    if (favoriteList.isNotEmpty) {
      storageService.appSecureStorage.saveItemInStorage(
          key: AppStorageKeys.favoriteList, value: jsonEncode(favoriteList));
    }
  }

  Future<void> readUserLikes() async {
    String? result = await storageService.appSecureStorage
        .readItemFromStorage(key: AppStorageKeys.favoriteList);
    if (result != null) {
      //favoriteList.clear();
      final List val = jsonDecode(result);
      favoriteList.addAll(val.map((e) => e as int).toList());
    }
  }

  bool checkIsFavorite({required int eventId}) {
    if (favoriteList.contains(eventId)) {
      return true;
    }
    return false;
  }

  handleFavoriteAction({required int eventId}) {
    if (favoriteList.contains(eventId)) {
      favoriteList.remove(eventId);
    } else {
      favoriteList.add(eventId);
    }
    saveUserLikes();
    update();
  }
}
