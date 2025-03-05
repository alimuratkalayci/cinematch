import 'dart:io';
import 'package:cinematch/features/profile_screen/details_page/photo_add_page/services/post_photo_web_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoAddPageProvider with ChangeNotifier {
  final PostPhotoUrlWebService _photoUrlService = PostPhotoUrlWebService();
  final ImagePicker _picker = ImagePicker();

  XFile? _image;
  String? _photoUrl;

  XFile? get image => _image;
  String? get photoUrl => _photoUrl;

  Future pickImage() async {
    try {
      final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        _image = pickedImage;
        notifyListeners();
      }
    } catch (e) {
      print('Resim seçme hatası: $e');
    }
  }

  Future submitPhoto(BuildContext context) async {
    if (_image != null) {
      try {
        final result = await _photoUrlService.postPhotoUrl(photo: File(_image!.path));

        if (result['success']) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Fotoğraf başarıyla yüklendi!')),
          );

        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Fotoğraf yüklenirken hata oluştu: ${result['statusCode']} - ${result['body']}')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Bir hata oluştu: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lütfen önce bir fotoğraf seçin')),
      );
    }
  }
}