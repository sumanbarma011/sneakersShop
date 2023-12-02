// import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MainScreenNotifier extends ChangeNotifier {
  int _pageindex = 0;
  int get pageIndex {
    return _pageindex;
  }

  set pageIndex(int newIndex) {
    _pageindex = newIndex;
    notifyListeners();
  }
}
