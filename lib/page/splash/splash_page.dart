import 'package:flutter/material.dart';
import 'package:flutter_wan_android_ike/widget/splash/Animated_time_cut_down.dart';
import 'package:flutter_wan_android_ike/widget/splash/animated_android_logo.dart';
import 'package:flutter_wan_android_ike/widget/splash/animated_flutter_logo.dart';

import '../../utils/string_utils.dart';

/// Splash 界面
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _timeCutDownController;
  late Animation<double> _animation;

  @override
  void initState() {
    print("splash initState");

    _logoController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _timeCutDownController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: _logoController, curve: Curves.easeInOutBack);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _logoController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _logoController.forward();
      }
    });
    _logoController.forward();
    _timeCutDownController.forward();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    print("splash dispose");
    _logoController.dispose();
    _timeCutDownController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image(
              image: AssetImage(StringUtils.wrapperAssets("splash_bg.png")),
              fit: BoxFit.cover),
          Positioned(
            right: 10,
            bottom: 10,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: 80,
                height: 30,
                child: AnimatedTimeCutDown(
                    animation: StepTween(begin: 3, end: 0)
                        .animate(_timeCutDownController),
                    context: context),
                decoration: BoxDecoration(
                    color: Colors.black.withAlpha(100),
                    borderRadius: BorderRadius.circular(40)),
              ),
            ),
          ),
          AnimatedFlutterLogo(animation: _animation),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimatedAndroidLogo(animation: _animation),
              ],
            ),
            alignment: Alignment(0.0, 0.7),
          )
        ],
      ),
    );
  }
}
