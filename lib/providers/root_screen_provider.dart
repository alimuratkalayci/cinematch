import 'package:flutter/material.dart';

class RootScreenProvider with ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void changePage(int page) {
    _currentPage = page;
    notifyListeners();
  }
  void resetPage() {
    _currentPage = 0;
    notifyListeners();
  }
}
