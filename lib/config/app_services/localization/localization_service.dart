import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:live_events_clean_architecture/config/app_services/locale_storage/app_storage_keys.dart';
import 'package:live_events_clean_architecture/config/app_services/locale_storage/storage_service.dart';
import 'package:logger/logger.dart';

import '../../../core/utils/constants/app_assets.dart';

const englishKey = "en";
const arabicKey = "ar";

class LocalizationService extends Translations {
  final storageService = Get.find<StorageService>();

  static Map<String, String> en = {"x": "x"};

  static Map<String, String> ar = {"x": "x"};
  static const fallbackLocale = Locale('en', 'US');

  Future<void> loadTranslationsFiles() async {
    try {
      en = Map<String, String>.from(
          json.decode(await rootBundle.loadString('$i18n/en.json')));
      ar = Map<String, String>.from(
          json.decode(await rootBundle.loadString('$i18n/ar.json')));
    } catch (ex) {
      print(ex);
    }
  }

  @override
  Map<String, Map<String, String>> get keys => {
        englishKey: en,
        arabicKey: ar,
      };

  Future<void> changeLocale(String langCode) async {
    Logger().d("changeLocale - langCode: $langCode");
    storageService.saveItemInStorage(
        key: AppStorageKeys.appLanguageCode, value: langCode);
    Get.updateLocale(Locale(langCode));
  }

  String getCurrentLocal() {
    Logger().d("Get.locale: ${Get.locale.toString()}");
    return Get.locale.toString();
  }
}
