import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android_ike/page/main/main_page.dart';

/// 动画倒计时
class AnimatedTimeCutDown extends AnimatedWidget {
  Animation<int> animation;
  BuildContext context;

  AnimatedTimeCutDown(
      {Key? key, required this.animation, required this.context})
      : super(key: key, listenable: animation) {
    animation.addStatusListener(_animatedStatusChanged);
  }

  void _animatedStatusChanged(AnimationStatus status) {
    print("动画状态:$status");
    if (status == AnimationStatus.completed) {
      print("倒计时结束");
      animation.removeStatusListener(_animatedStatusChanged);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const MainPage();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    Animation<int> animation = listenable as Animation<int>;
    return Text("${animation.value}s | 跳过 ",
        style: const TextStyle(color: Colors.white));
  }
}
