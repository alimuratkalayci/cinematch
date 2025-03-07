import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class PostPhotoUrlWebService {
  final String baseUrl = "https://caseapi.nodelabs.dev/user/upload_photo";
  final FlutterSecureStorage storage = FlutterSecureStorage();

  Future<Map<String, dynamic>> postPhotoUrl({
    required File photo,
  }) async {
    final token = await storage.read(key: 'token');

    try {
      final url = Uri.parse(baseUrl);

      var request = http.MultipartRequest('POST', url);

      request.headers['Authorization'] = 'Bearer $token';

      var file = await http.MultipartFile.fromPath(
        'file',
        photo.path,
        contentType: MediaType('image', 'jpeg'),
      );

      request.files.add(file);

      var streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        return {
          'success': true,
          'statusCode': response.statusCode,
          'body': response.body
        };
      } else {
        return {
          'success': false,
          'statusCode': response.statusCode,
          'body': response.body
        };
      }
    } catch (e) {
      print("API Hatası: $e");
      return {'success': false, 'error': e.toString()};
    }
  }
}
