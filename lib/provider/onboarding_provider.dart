import 'package:flutter/material.dart';

class OnboardingProvider with ChangeNotifier {
  double _currentIndex = 0;

  double get currentIndex => _currentIndex;

  set currentIndex(double currentIndex) {
    if (currentIndex == _currentIndex) {
      return;
    }
    _currentIndex = currentIndex;
    notifyListeners();
  }
}
