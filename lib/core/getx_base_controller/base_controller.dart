import 'package:get/get.dart';
import 'package:live_events_clean_architecture/core/app_global_services/settings_service.dart';
import 'package:live_events_clean_architecture/core/enums/app_enum.dart';


///Note: any shared behavior between controllers should go here
///here loading state for different controller state when calling api

class BaseController extends GetxController {
  final SettingsService settingsService = Get.find<SettingsService>();

  LoadingState _loadingState = LoadingState.done.obs();

  set updateState(LoadingState state) {
    _loadingState = state;
    update();
  }

  LoadingState get loadingState => _loadingState;
}
