import 'package:cinematch/features/auth/providers/auth_provider.dart';
import 'package:cinematch/providers/root_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/auth/screens/login_screen/login_screen.dart';
import 'features/profile_screen/provider/profile_page_provider.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<RootScreenProvider>(create: (context) => RootScreenProvider(),),
        ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider(),),
        ChangeNotifierProvider<ProfilePageProvider>(create: (context) => ProfilePageProvider(),),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
