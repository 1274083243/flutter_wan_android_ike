import 'package:flutter/material.dart';

/// 公众号页面
class WeChatAccountPage extends StatefulWidget {
  const WeChatAccountPage({Key? key}) : super(key: key);

  @override
  State<WeChatAccountPage> createState() => _WeChatAccountPageState();
}

class _WeChatAccountPageState extends State<WeChatAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("我是公众号页面"),
    );
  }
}
