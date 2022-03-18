import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android_ike/utils/string_utils.dart';

/// android 动画图标
class AnimatedAndroidLogo extends AnimatedWidget {
  AnimatedAndroidLogo({required Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable as Animation<double>;
    return Row(
      children: [
        Image.asset(
          StringUtils.wrapperAssets("splash_fun.png"),
          width: 140 * animation.value,
          height: 80 * animation.value,
        ),
        Image.asset(
          StringUtils.wrapperAssets("splash_android.png"),
          width: 200 * (1 - animation.value),
          height: 80 * (1 - animation.value),
        )
      ],
    );
  }
}
