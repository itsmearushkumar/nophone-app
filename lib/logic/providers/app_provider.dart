import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  bool isUsingPhone = false;

  int seconds = 10; // for testing (later change to 300)

  void simulateDetection() {
    isUsingPhone = true;
    notifyListeners();
  }

  void startTimer() async {
    seconds = 10;

    while (seconds > 0) {
      await Future.delayed(Duration(seconds: 1));
      seconds--;
      notifyListeners();
    }
  }

  void reset() {
    isUsingPhone = false;
    seconds = 10;
    notifyListeners();
  }
}