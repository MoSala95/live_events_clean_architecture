import 'package:get/get.dart';

import '../../config/app_services/settings_service.dart';
import '../utils/enums/app_enum.dart';

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
