import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthServices {
  final String baseUrlRegister = "https://caseapi.nodelabs.dev/user/register";
  final String baseUrlLogin = "https://caseapi.nodelabs.dev/user/login";

  Future<http.Response> postRegistrationProcess({
    required String email,
    required String name,
    required String password,
  }) async {
    try {

      final url = Uri.parse(baseUrlRegister);

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": email,
          "name": name,
          "password": password,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception(
            'Kayıt işlemi başarısız oldu: ${response.statusCode} - ${response.body}');
      }

      return response;
    } catch (e) {
      print("API Hatası: $e");
      throw Exception("API isteğinde hata oluştu: $e");
    }
  }

  Future<http.Response> postLoginProcess({
    required String email,
    required String password,
}) async {
    try {

      final url = Uri.parse(baseUrlLogin);

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception(
            'Giriş işlemi başarısız oldu: ${response.statusCode} - ${response.body}');
      }

      return response;
    } catch (e) {
      print("API Hatası: $e");
      throw Exception("API isteğinde hata oluştu: $e");
    }
  }
}
