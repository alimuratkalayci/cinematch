import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import '../../providers/root_screen_provider.dart';


class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<RootScreenProvider>(context);

    return BottomNavigationBar(
      currentIndex: pageProvider.currentPage,
      onTap: (index) {
        pageProvider.changePage(index);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(IconlyLight.home), label: "Ana Sayfa"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
      ],
    );
  }
}
