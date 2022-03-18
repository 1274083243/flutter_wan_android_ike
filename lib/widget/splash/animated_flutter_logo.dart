import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/string_utils.dart';

/// 带动画的FlutterLogo组件
class AnimatedFlutterLogo extends AnimatedWidget {
  const AnimatedFlutterLogo({required Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable as Animation<double>;
    return AnimatedAlign(
      alignment: Alignment(0.0, 0.2 + animation.value * 0.3),
      duration: const Duration(microseconds: 10),
      curve: Curves.bounceIn,
      child: Image(
        image: AssetImage(StringUtils.wrapperAssets("splash_flutter.png")),
        width: 280,
        height: 120,
      ),
    );
  }
}
