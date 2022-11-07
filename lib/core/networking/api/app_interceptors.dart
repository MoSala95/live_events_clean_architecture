import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '../../../config/app_services/settings_service.dart';
import '../../utils/print.dart';
import 'end_points.dart';

class AppInterceptors extends Interceptor {
  SettingsService settingsService = getx.Get.find<SettingsService>();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.queryParameters.addAll({"client_id": EndPoints.clientId});
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    iPrint("response: ${response.data}");
    super.onResponse(response, handler);
  }
}
