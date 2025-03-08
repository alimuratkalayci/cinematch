import 'package:cinematch/constants/ui_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffE50914),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      onPressed: () {
        String currentLocale =
            Provider.of<LanguageProvider>(context, listen: false).locale;
        String newLocale = currentLocale == 'en' ? 'tr' : 'en';
        Provider.of<LanguageProvider>(context, listen: false)
            .changeLanguage(newLocale);
      },
      child: Text(
        Provider.of<LanguageProvider>(context).locale == 'en'
            ? 'Translate to Turkish'
            : 'İngilizceye çevir',
        style: CustomTextStyle.MontSerrat15pxMediumWhite,
      ),
    );
  }
}
