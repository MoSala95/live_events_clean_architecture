import 'package:get/get.dart';
import 'package:live_events_clean_architecture/core/app_global_services/settings_service.dart';


class AppValidator {
  static final settingsService = Get.find<SettingsService>();

  static String? validateUserName(String? input, {String? emptyMessage}) {
    String englishPattern =
        r"^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z\s]*$"; // RegExp regex = RegExp(pattern);
    String emojiePattern =
        r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])';
    String arabicPattern = r"^[\sa-zA-Zء-ي]*$";
    String namePattern = r"^[\p{Letter} ]+$";

    if (input!.isNotEmpty) {
      bool validateEmaojie = !RegExp(emojiePattern).hasMatch(input);
      String charactersPattern =
          settingsService.isArabic ? arabicPattern : englishPattern;
      bool validateCharacters = RegExp(charactersPattern).hasMatch(input) &&
          RegExp(namePattern, unicode: true).hasMatch(input);

      if (validateCharacters && validateEmaojie) {
        return null;
      } else {
        return emptyMessage;
      }
    } else {
      return "enterCorrectName".tr;
    }
  }


  static bool isNumeric(String text) {
    return double.tryParse(text) != null;
  }

  static String? validateEmail(String input, {String? emptyMessage}) {
    if (emptyMessage != null && input.isEmpty) {
      return emptyMessage;
    }

    if (GetUtils.isEmail(input)) {
      return null;
    } else {
      return "InvalidEmail".tr;
    }
  }

  static String? validateSPassword(String input, {String? emptyMessage}) {
    if (emptyMessage != null && input.isEmpty) {
      return emptyMessage;
    }

    RegExp regex = RegExp(
        r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!#$&()*%+,-./:;<=>?@[\]^_`{|}~]).{8,}$');

    if (!regex.hasMatch(input)) {
      return "enter_hard_password".tr;
    }
    return null;
  }

}
