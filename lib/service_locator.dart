import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:live_events_clean_architecture/config/app_services/locale_storage/storage_service.dart';

import 'config/app_services/network_connection_status/network_connection_status.dart';
import 'config/app_services/settings_service.dart';
import 'core/networking/api/api_consumer.dart';
import 'core/networking/api/app_interceptors.dart';
import 'core/networking/api/dio_consumer.dart';

void serviceLocator() {
  // ! permanent to avoid remove it from memory
  Get.put<NetworkConnectionStatus>(NetworkConnectionStatus(), permanent: true);
  Get.put<StorageService>(StorageService(), permanent: true);

  Get.put<SettingsService>(SettingsService(), permanent: true);

  Get.lazyPut<Dio>(() => Dio());
  Get.lazyPut(() => AppInterceptors());
  // ? why puy not lazyput
  Get.put<ApiConsumer>(DioConsumer());
}
