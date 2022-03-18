import 'package:flutter/material.dart';

/// 体系页面
class StructurePage extends StatefulWidget {
  const StructurePage({Key? key}) : super(key: key);

  @override
  State<StructurePage> createState() => _StructurePagePageState();
}

class _StructurePagePageState extends State<StructurePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("我是体系页页面"),
    );
  }
}
