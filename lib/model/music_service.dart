import 'package:flutter/material.dart';

class MusicService with ChangeNotifier {
  int selectIndex = 0;
  void updaterIndexMusique(int index) {
    selectIndex = index;
    notifyListeners();
  }
}
