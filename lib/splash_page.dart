import 'package:flutter/material.dart';
import 'package:flutter_wan_android_ike/viewmodel/SplashViewModel.dart';
import 'package:provider/provider.dart';

/// Splash 界面
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        var model = SplashViewModel();
        model.startTimeCountDown(5);
        return model;
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          print("腹肌参数:${constraints.biggest.width}");
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=851178854,1709478981&fm=26&gp=0.jpg",
                fit: BoxFit.cover,
              ),
              Positioned(
                  right: 20,
                  top: MediaQuery.of(context).padding.top + 10,
                  child: GestureDetector(
                    onTap: () {
                      print("点击了跳过");
                    },
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 2.8),
                      alignment: Alignment.center,
                      width: 70,
                      height: 30,
                      child: Consumer<SplashViewModel>(
                        builder: (context, model, child) {
                          return Text(
                            "剩余${model.totalCount}s",
                            style: const TextStyle(
                              color: Colors.white,
                              textBaseline: TextBaseline.ideographic,
                            ),
                            textAlign: TextAlign.center,
                          );
                        },
                      ),
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ))
            ],
          );
        },
      ),
    );
  }
}
