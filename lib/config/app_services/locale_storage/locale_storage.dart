import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:live_events_clean_architecture/core/utils/print.dart';

class AppSecureStorage {
  static final AppSecureStorage appSecureStorage = AppSecureStorage._internal();

  factory AppSecureStorage() => appSecureStorage;

  AppSecureStorage._internal();

  final FlutterSecureStorage flutterSecureStorage =
      const FlutterSecureStorage();

  Future<bool> saveItemInStorage(
      {required String key, required String value}) async {
    print("---saveItemInStorage--key: $key- value: $value");
    try {
      await flutterSecureStorage.write(key: key, value: value);
      return true;
    } catch (e) {
      iPrint(e.toString());
      return false;
    }
  }

  Future<String?> readItemFromStorage({required String key}) async {
    return await flutterSecureStorage.read(key: key);
  }

  void clearStorage() {
    flutterSecureStorage.deleteAll();
  }

  void deleteItemFromStorage({required String key}) {
    flutterSecureStorage.delete(key: key);
  }
}
