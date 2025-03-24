import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int currentPageIndex = 0;

  void changePage(int index) {
    currentPageIndex = index;
    notifyListeners();
  }
}
