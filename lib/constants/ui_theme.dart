import 'package:flutter/material.dart';

class CustomTextStyle {
  // Euclid Circular A Font Stilleri
  static TextStyle regular = const TextStyle(
    fontFamily: 'EuclidCircularA',
    fontWeight: FontWeight.normal,
    fontSize: 16, // Yazı boyutunu buradan ayarlayabilirsiniz
    color: AppColors.primaryTextColor, // Varsayılan metin rengi
  );

  static TextStyle circular18px600wWhite = const TextStyle(
    fontFamily: 'EuclidCircularA',
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: Color(0xffFFFFFF),
  );

  static TextStyle circular13px400wWhite = const TextStyle(
    fontFamily: 'EuclidCircularA',
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: Color(0xffFFFFFF),
  );
  static TextStyle circular13px700wWhite = const TextStyle(
    fontFamily: 'EuclidCircularA',
    fontWeight: FontWeight.w700,
    fontSize: 13,
    color: Color(0xffFFFFFF),
  );

  static TextStyle circular12px400wWhite = const TextStyle(
    fontFamily: 'EuclidCircularA',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: Color(0xffFFFFFF),
  );

  static TextStyle circular15px500wWhite = const TextStyle(
    fontFamily: 'EuclidCircularA',
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: Color(0xffFFFFFF),
  );

  static TextStyle circular12px400wWhiteOpacity50 = TextStyle(
    fontFamily: 'EuclidCircularA',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: const Color(0xffFFFFFF).withOpacity(0.5),
  );

  static TextStyle bold = const TextStyle(
    fontFamily: 'EuclidCircularA',
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: AppColors.primaryTextColor,
  );

  static TextStyle circular13pxBoldWhite = const TextStyle(
    fontFamily: 'EuclidCircularA',
    fontWeight: FontWeight.bold,
    fontSize: 13,
    color: Color(0xffFFFFFF),
  );

  static TextStyle circular15pxMediumWhite = const TextStyle(
    fontFamily: 'EuclidCircularA',
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: Color(0xffFFFFFF),
  );

  static TextStyle MontSerrat15pxMediumWhite = const TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
    fontSize: 15,
    color: Color(0xffFFFFFF),
  );

}

class AppColors {
  // Uygulama renkleri
  static const Color primaryColor = Color(0xFF6200EE);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color backgroundColor = Color(0xff090909);
  static const Color primaryTextColor = Color(0xFF212121);
  static const Color secondaryTextColor = Color(0xFF757575);
  static const Color accentColor = Color(0xFFFFC107);
  static const Color errorColor = Color(0xFFB00020);
  static const Color buttonRed = Color(0xffE50914);
}
