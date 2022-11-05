import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_events_clean_architecture/core/enums/app_enum.dart';
import 'package:live_events_clean_architecture/router/routes_constants.dart';

import '../utils/print.dart';
import 'app_secure_storage.dart';

class SettingsService extends GetxService {
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
    super.onInit();
    environmentType =
        isTesting == true ? EnviromentTypes.staging : EnviromentTypes.preLive;
    await initializeSettingService();
  }

  Future<void> initializeSettingService() async {

    await initStorageData();
  }

  bool get isArabic {
    return languageCode.value == "ar";
  }

  Future<void> initStorageData() async {
    languageCode.value = await readAppLang();
     // fire saved language //
    Get.updateLocale(Locale(languageCode.value));
    accessToken = await readAccessToken();
    refreshToken = await readRefreshToken();
    isFirst = await readIsFirst();

    isFirst = await checkIsFirst();
    // specialityId = await readSpecialityId();
  }

  Future<void> saveAccessToken(String value) async {
    accessToken = value;
    await appSecureStorage.saveItemInStorage(
        key: AppStorageKeys.accessToken, value: value);
  }

  Future<String> readAccessToken() async {
    return await appSecureStorage.readItemFromStorage(
            key: AppStorageKeys.accessToken) ??
        "";
  }

  Future<void> saveRefreshToken(String value) async {
    refreshToken = value;
    await appSecureStorage.saveItemInStorage(
        key: AppStorageKeys.refreshToken, value: value);
  }

  Future<String> readRefreshToken() async {
    return await appSecureStorage.readItemFromStorage(
            key: AppStorageKeys.refreshToken) ??
        "";
  }



  Future<void> saveEnvironment(EnviromentTypes type) async {
    environmentType = type;
    await appSecureStorage.saveItemInStorage(
        key: AppStorageKeys.environment, value: type.name);
  }

  Future<void> saveIsFirst(bool value) async {
    isFirst = value;
    await appSecureStorage.saveItemInStorage(
        key: AppStorageKeys.appFirstOpen, value: "$value");
  }


  Future<bool> readIsFirst() async {
    return await appSecureStorage.readItemFromStorage(
                key: AppStorageKeys.appFirstOpen) ==
            null
        ? true
        : false;
  }

  Future<bool> checkIsFirst() async {
    String? isFirst =
        await appSecureStorage.readItemFromStorage(key: AppStorageKeys.appFirstOpen);
    return isFirst == null ? true : false;
  }

  Future<void> saveAppLang(String langCode) async {
    languageCode.value = langCode;

    await appSecureStorage.saveItemInStorage(
        key: AppStorageKeys.appLanguageCode, value: langCode);
  }

  Future<String> readAppLang() async {
    String? langCode = await appSecureStorage.readItemFromStorage(
        key: AppStorageKeys.appLanguageCode);
    return langCode ??
        (Get.deviceLocale == null ? "en" : Get.deviceLocale!.languageCode);
  }


}
