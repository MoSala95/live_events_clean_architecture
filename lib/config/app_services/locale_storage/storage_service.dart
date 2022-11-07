import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_events_clean_architecture/config/app_services/locale_storage/app_storage_keys.dart';
import 'package:live_events_clean_architecture/core/utils/enums/app_enum.dart';

import 'locale_storage.dart';

class StorageService extends GetxService {
  AppSecureStorage appSecureStorage = AppSecureStorage();
  RxString languageCode = "en".obs;
  bool? isFirst = true;
  String accessToken = "";
  String refreshToken = "";

  /// isTesting  if we are working in test environment or not
  bool isTesting = true;
  EnviromentTypes environmentType = EnviromentTypes.staging;

  @override
  void onInit() async {
    // TODO: implement onInit
    environmentType =
        isTesting == true ? EnviromentTypes.staging : EnviromentTypes.preLive;
    super.onInit();
  }

  Future<void> initStorageData() async {
    languageCode.value = await appSecureStorage.readItemFromStorage(
            key: AppStorageKeys.appLanguageCode) ??
        (Get.deviceLocale == null ? "en" : Get.deviceLocale!.languageCode);
    // fire saved language //
    Get.updateLocale(Locale(languageCode.value));
    accessToken = await appSecureStorage.readItemFromStorage(
            key: AppStorageKeys.accessToken) ??
        "";
    refreshToken = await appSecureStorage.readItemFromStorage(
            key: AppStorageKeys.refreshToken) ??
        "";
    isFirst = (await appSecureStorage.readItemFromStorage(
            key: AppStorageKeys.appFirstOpen) ??
        "false") as bool;
    // specialityId = await readSpecialityId();
  }

  bool get isArabic {
    return languageCode.value == "ar";
  }

  void saveItemInStorage({required String key, required String value}) {
    appSecureStorage.saveItemInStorage(key: key, value: value);
  }

  Future<String?> readItemFromStorage({required String key}) async {
    return await appSecureStorage.readItemFromStorage(
      key: key,
    );
  }

  void deleteItemFromStorage({required String key}) {
    appSecureStorage.deleteItemFromStorage(key: key);
  }

  void clearStorage() {
    appSecureStorage.clearStorage();
  }
}
