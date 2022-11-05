import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:live_events_clean_architecture/core/app_global_services/settings_service.dart';
import 'package:live_events_clean_architecture/core/network_connection_status/network_connection_status.dart';

import 'core/api/api_consumer.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';


void setupLocator() {
  Get.put<NetworkConnectionStatus>(NetworkConnectionStatus(), permanent: true);
  Get.put<SettingsService>(SettingsService(), permanent: true);

  Get.lazyPut<Dio>(
    () => Dio(),
  );
 Get.lazyPut(() => AppInterceptors());

  Get.put<ApiConsumer>(
    DioConsumer(),
  );
}
