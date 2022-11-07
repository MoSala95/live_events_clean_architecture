import '../../utils/print.dart';

class ApiClient {
  static Future<Map<String, dynamic>?> callApiAndHandleResponse(
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
