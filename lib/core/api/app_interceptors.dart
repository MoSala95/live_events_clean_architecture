import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:live_events_clean_architecture/core/api/end_points.dart';
import 'package:live_events_clean_architecture/core/app_global_services/settings_service.dart';
import 'package:live_events_clean_architecture/core/constants/app_constants.dart';
 import 'package:live_events_clean_architecture/core/utils/print.dart';

class AppInterceptors extends Interceptor {
  SettingsService settingsService = getx.Get.find<SettingsService>();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {

    options.queryParameters.addAll({"client_id":EndPoints.clientId});
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
     iPrint("response: ${response.data}");
    super.onResponse(response, handler);
  }
}
