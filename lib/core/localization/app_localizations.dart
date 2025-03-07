import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'liked_movies': 'Liked Movies',
      'no_favorite_movie': "You haven't added any favorite movies yet.",
      'movies': 'Movies',
      'profile': 'Profile',
      'home_page': 'Home',
      'explore': 'Explore',
      'add_photo': 'Add Photo',
      'Action': 'Action',
      'Adventure': 'Adventure',
      'Fantasy': 'Fantasy',
      'Drama': 'Drama',
      'Horror': 'Horror',
      'Comedy': 'Comedy',
      'Crime': 'Crime',
      'Biography': 'Biography',
      'upload_your_photo': 'Upload Your Photo',
      'continue': 'Continue',
      'go_back': 'Go back',
      'more': 'More',
      'less': 'Less',
      'limited_offer': 'Limited Offer',
      'choose_jeton_package':
          'Earn bonuses and unlock new levels by choosing the coin pack!',
      'bonuses_you_will_receive': 'Bonuses you will receive',
      'premium': 'Premium',
      'account': 'Account',
      'matches': 'Matches',
      'highlight': 'Highlights',
      'likes': 'Likes',
      'select_token_pack': 'Select a token pack to unlock',
      'weekly': 'Weekly',
      'see_all_tokens': 'See all tokens',
      'token': 'Token',
    },
    'tr': {
      'liked_movies': 'Beğendiğim Filmler',
      'no_favorite_movie': "Henüz favori film eklemediniz.",
      'movies': 'Filmler',
      'profile': 'Profil',
      'home_page': 'Ana Sayfa',
      'explore': 'Keşfet',
      'add_photo': 'Fotoğraf Ekle',
      'Action': 'Aksiyon',
      'Adventure': 'Macera',
      'Fantasy': 'Fantastik',
      'Drama': 'Dram',
      'Horror': 'Korku',
      'Comedy': 'Komedi',
      'Crime': 'Suç',
      'Biography': 'Biyografi',
      'upload_your_photo': 'Fotoğrafınızı Yükleyin',
      'continue': 'Devam Et',
      'go_back': 'Geri git',
      'more': 'Daha Fazla',
      'less': 'Daha Az',
      'limited_offer': 'Sınırlı Teklif',
      'choose_jeton_package':
          'Jeton paketini seçerek bonus kazanın ve yeni bölümlerin kilidini açın!',
      'bonuses_you_will_receive': 'Alacağınız bonuslar',
      'premium': 'Premium',
      'account': 'Hesap',
      'matches': 'Eşleşme',
      'highlight': 'Öne\nÇıkarma',
      'likes': 'Beğeni',
      'select_token_pack': 'Kilidi açmak için bir jeton paketi seçin',
      'weekly': 'Haftalık',
      'see_all_tokens': 'Tüm jetonları gör',
      'token': 'Jeton',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}

/// **Flutter'a nasıl lokalizasyon yükleneceğini öğreten delegate sınıfı**
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'tr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
