import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:live_events_clean_architecture/core/app_global_services/settings_service.dart';

import '../error/exceptions.dart';
 import '../utils/print.dart';
import 'api_consumer.dart';
import 'end_points.dart';

class ApiClient {

  static Future<Map<String,dynamic>?> callApiAndHandleResponse(
      Function() request) async {
    try {
      iPrint(
          "===================ApiClient - callApiAndHandleResponse ===================");
      final response = await request();

      return response;
    } catch (e) {
      ePrint(e.toString());
    }
  }

}
