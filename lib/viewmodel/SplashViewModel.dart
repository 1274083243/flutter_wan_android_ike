import 'dart:async';

import 'package:flutter/cupertino.dart';

class SplashViewModel extends ChangeNotifier {
  Timer? timer;
  int totalCount = 5;

  /// 开始倒计时
  void startTimeCountDown(int time) {
    if (time < 0) {
      return;
    }
    totalCount = time;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      totalCount--;
      notifyListeners();
      if (totalCount == 0) {
        print("倒计时结束");
        this.timer?.cancel();
        this.timer = null;
      }
    });
  }
}
