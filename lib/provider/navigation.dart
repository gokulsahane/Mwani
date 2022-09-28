import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _pageIndex = 4;
  get currentIndex => _pageIndex;

  set changePage(int i) {
    _pageIndex = i;
    notifyListeners();
  }
}
