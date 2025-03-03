import 'package:cinematch/features/profile_screen/profile_screen.dart';
import 'package:cinematch/providers/root_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/custom_bottom_nav_bar.dart';
import 'features/home_screen/home_screen.dart';

class RootScreen extends StatefulWidget {
  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final List<Widget> _pages = [
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    // Provider'ı sıfırla
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RootScreenProvider>(context, listen: false).resetPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<RootScreenProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      body: IndexedStack(
        index: pageProvider.currentPage,
        children: _pages,
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
