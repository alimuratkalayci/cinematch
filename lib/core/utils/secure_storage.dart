import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Create a method to get Android options
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  // Initialize FlutterSecureStorage with Android options
  late final FlutterSecureStorage storage;

  // Constructor
  SecureStorage() {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  }

  // Write secure data
  Future<void> writeSecureData(String key, String value) async {
    try {
      await storage.write(key: key, value: value);
    } catch (e) {
      print('Error writing secure data: $e');
    }
  }

  // Read secure data
  Future<String> readSecureData(String key) async {
    try {
      return await storage.read(key: key) ?? "No Data Found";
    } catch (e) {
      print('Error reading secure data: $e');
      return "No Data Found";
    }
  }

  // Delete secure data
  Future<void> deleteSecureData(String key) async {
    try {
      await storage.delete(key: key);
    } catch (e) {
      print('Error deleting secure data: $e');
    }
  }

  // Optional: Method to delete all secure data
  Future<void> deleteAllSecureData() async {
    try {
      await storage.deleteAll();
    } catch (e) {
      print('Error deleting all secure data: $e');
    }
  }
}