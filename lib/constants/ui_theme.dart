import 'package:flutter/material.dart';

class CustomTextStyle {
  // Euclid Circular A Font Stilleri
  static TextStyle regular = TextStyle(
    fontFamily: 'EuclidCircularA',
    fontWeight: FontWeight.normal,
    fontSize: 16, // Yazı boyutunu buradan ayarlayabilirsiniz
    color: AppColors.primaryTextColor, // Varsayılan metin rengi
  );

  static TextStyle circular18px600wWhite = TextStyle(
    fontFamily: 'EuclidCircularA',
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: Color(0xffFFFFFF),
  );

  static TextStyle circular13px400wWhite = TextStyle(
    fontFamily: 'EuclidCircularA',
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: Color(0xffFFFFFF),
  );

  static TextStyle bold = TextStyle(
    fontFamily: 'EuclidCircularA',
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: AppColors.primaryTextColor, // Başlık veya vurgu için
  );
}

class AppColors {
  // Uygulama renkleri
  static const Color primaryColor = Color(0xFF6200EE); // Ana renk
  static const Color secondaryColor = Color(0xFF03DAC6); // İkinci renk
  static const Color backgroundColor = Color(0xff090909); // Arka plan rengi
  static const Color primaryTextColor = Color(0xFF212121); // Ana metin rengi
  static const Color secondaryTextColor = Color(0xFF757575); // İkinci metin rengi
  static const Color accentColor = Color(0xFFFFC107); // Vurgulama rengi
  static const Color errorColor = Color(0xFFB00020); // Hata rengi
}
