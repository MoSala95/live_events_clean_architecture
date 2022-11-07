import 'package:get/get.dart';

import '../../../config/app_services/settings_service.dart';

class NumberHelper {
  static final SettingsService settingService = Get.find<SettingsService>();

  static String translateNumberToAnotherLanguage(
    String input, {
    required bool isTranslateFromEnglishToArabic,
  }) {
    if (input.isEmpty) return "";
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    for (int i = 0; i < english.length; i++) {
      if (isTranslateFromEnglishToArabic) {
        input = input.replaceAll(english[i], arabic[i]);
      } else {
        input = input.replaceAll(arabic[i], english[i]);
      }
    }
    return input;
  }
}
