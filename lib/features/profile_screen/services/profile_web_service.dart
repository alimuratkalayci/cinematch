import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ProfileWebService {
  final String baseUrl = "https://caseapi.nodelabs.dev/user/profile";
  final FlutterSecureStorage storage = FlutterSecureStorage();

  Future fetchProfileDatas() async {

    final token = await storage.read(key: 'token');

    if (token == null) {
      throw Exception('Token eksik');
    }


    final url = Uri.parse(baseUrl);


    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    return response;
  }
}
