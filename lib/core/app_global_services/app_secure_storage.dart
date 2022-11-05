import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSecureStorage {
  static final AppSecureStorage appSecureStorage = AppSecureStorage._internal();

  factory AppSecureStorage() => appSecureStorage;

  AppSecureStorage._internal();

  final FlutterSecureStorage flutterSecureStorage =
      const FlutterSecureStorage();

  Future<void> saveItemInStorage(
      {required String key, required String value}) async {
    print("---saveItemInStorage--key: $key- value: $value");
    await flutterSecureStorage.write(key: key, value: value);
  }

  Future<String?> readItemFromStorage({required String key}) async {
    return await flutterSecureStorage.read(key: key);
  }

  void clearStorage() {
    flutterSecureStorage.deleteAll();
  }

  void clearItemFromStorage(String key) {
    flutterSecureStorage.delete(key: key);
  }

  checkAppFirstOpen() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getBool(AppStorageKeys.appFirstOpen) ?? true) {
      await flutterSecureStorage.deleteAll();

      prefs.setBool(AppStorageKeys.appFirstOpen, false);
    }
  }
}

class AppStorageKeys {
  static const environment = 'app_environment';
  static const appFirstOpen = 'app_first_open';
  static const isAgreedToTerms = 'is_agreed_to_terms';
  static const appLanguageCode = 'app_lang_code';
  static const accessToken = 'accessToken';
  static const refreshToken = 'refreshToken';
  static const favoriteList = 'favoriteList';

}
