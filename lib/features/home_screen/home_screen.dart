import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff090909),
      body: Column(
        children: [
          Text('anasayfa')
        ],
      ),
    );
  }
}
