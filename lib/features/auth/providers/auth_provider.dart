import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  final AuthServices _authServices = AuthServices();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> postRegistrationProvider(
      String email, String name, String password) async {
    try {
      final response = await _authServices.postRegistrationProcess(
          email: email, name: name, password: password);

      if (response.statusCode == 200) {
        debugPrint('API Yanıtı: ${response.body}');

        if (response.body.isEmpty || response.body == 'null') {
          throw Exception('Boş yanıt döndü.');
        }

        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse['data'] == null) {
          throw Exception('Beklenen veri yapısı bulunamadı.');
        }
        notifyListeners();
      } else {
        throw Exception('Veri alınamadı. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('API Hatası: $e');
      throw Exception('Veri alınırken hata oluştu: $e');
    }
  }

  Future<void> postLoginProvider(String email, String password) async {
    try {
      final response = await _authServices.postLoginProcess(
          email: email, password: password);

      if (response.statusCode == 200) {
        debugPrint('API Yanıtı: ${response.body}');

        if (response.body.isEmpty || response.body == 'null') {
          throw Exception('Boş yanıt döndü.');
        }

        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse['data'] == null) {
          throw Exception('Beklenen veri yapısı bulunamadı.');
        }

        final String? token = jsonResponse['data']['token'];
        if (token != null && token.isNotEmpty) {
          await _secureStorage.write(key: "token", value: token);
          debugPrint("Token başarıyla saklandı.");
        } else {
          throw Exception("Token alınamadı.");
        }

        notifyListeners();
      } else {
        throw Exception('Veri alınamadı. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('API Hatası: $e');
      throw Exception('Veri alınırken hata oluştu: $e');
    }
  }
}
