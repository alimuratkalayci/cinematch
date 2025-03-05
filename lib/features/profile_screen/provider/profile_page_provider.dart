import 'package:cinematch/features/profile_screen/models/profile_page_data_model.dart';
import 'package:cinematch/features/profile_screen/services/profile_web_service.dart';
import 'package:flutter/material.dart';

class ProfilePageProvider with ChangeNotifier {
  ProfilePageDataModel? _profilePageDataModel;

  // Veriye daha kolay erişim sağlamak için getter ekledik.
  Data? get profileData => _profilePageDataModel?.data;

  final ProfileWebService _profileWebService = ProfileWebService();

  Future<void> fetchProfileDatas() async {
    notifyListeners(); // Yükleniyor durumu için
    try {
      final response = await _profileWebService.fetchProfileDatas();

      if (response.statusCode == 200) {
        _profilePageDataModel = profilePageDataModelFromJson(response.body);
      } else {
        throw Exception('API isteği başarısız oldu');
      }
    } catch (error) {
      print('Hata: $error');
      throw error;
    } finally {
      notifyListeners();
    }
  }
}
