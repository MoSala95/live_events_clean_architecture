 import 'package:get/get.dart';
 import 'package:intl/intl.dart';
import 'package:live_events_clean_architecture/core/app_global_services/settings_service.dart';


class DateLogicHelper {
  static final SettingsService settingService = Get.find<SettingsService>();

  static String formatDateSlashDDMMYYYY(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  static String convertTimeToHHMMAFormat(DateTime dateTime) {
    String time = '';
    time = DateFormat('hh:mm a').format(dateTime);
    return time;
  }
}
