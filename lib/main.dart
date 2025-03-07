import 'package:cinematch/features/auth/providers/auth_provider.dart';
import 'package:cinematch/features/home_screen/provider/home_screen_provider.dart';
import 'package:cinematch/features/profile_screen/provider/profile_page_provider.dart';
import 'package:cinematch/providers/language_provider.dart';
import 'package:cinematch/providers/root_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/localization/app_localizations.dart';
import 'features/auth/screens/login_screen/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/splash_screen/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<RootScreenProvider>(
            create: (context) => RootScreenProvider()),
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()),
        ChangeNotifierProvider<ProfilePageProvider>(
            create: (context) => ProfilePageProvider()),
        ChangeNotifierProvider<HomeScreenProvider>(
            create: (context) => HomeScreenProvider()),
        ChangeNotifierProvider<LanguageProvider>(
            create: (context) => LanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, _) {
        return MaterialApp(
          title: 'Cinematch',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          localizationsDelegates: [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', ''),
            Locale('tr', ''),
          ],
          locale: Locale(languageProvider.locale),
          home: const SplashScreen(),
        );
      },
    );
  }
}
