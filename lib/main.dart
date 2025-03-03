import 'package:cinematch/providers/root_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/auth/screens/login_screen/login_screen.dart';



void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => RootScreenProvider(),
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
