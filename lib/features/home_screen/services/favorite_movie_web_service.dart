import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class FavoriteMovieWebService {
  final FlutterSecureStorage storage = FlutterSecureStorage();

  Future<http.Response> favoriteMovie(String id) async {
    final token = await storage.read(key: 'token');

    if (token == null) {
      throw Exception('Token eksik');
    }

    final url = Uri.parse("https://caseapi.nodelabs.dev/movie/favorite/$id");

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Veri çekme hatası: ${response.statusCode}');
      }

      return response;
    } catch (e) {
      throw Exception('Bağlantı hatası: $e');
    }
  }
}