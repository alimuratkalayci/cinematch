import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  String _locale = 'en';

  String get locale => _locale;

  void changeLanguage(String newLocale) {
    _locale = newLocale;
    notifyListeners();
  }
}
