import 'package:flutter/material.dart';
import 'package:flutter_wan_android_ike/page/main/home_page.dart';
import 'package:flutter_wan_android_ike/page/main/profile_page.dart';
import 'package:flutter_wan_android_ike/page/main/we_chat_account_page.dart';

import 'main/project_page.dart';
import 'main/structure_page.dart';

/// 主页tab容器
class TabNavigator extends StatefulWidget {
  const TabNavigator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TabNavigatorState();
}

class TabNavigatorState extends State<TabNavigator> {
  final PageController _pageController = PageController();
  final List<Widget> _pages = [
    const HomePage(),
    const ProjectPage(),
    const WeChatAccountPage(),
    const StructurePage(),
    const ProfilePage()
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          itemBuilder: (context, index) => _pages[index],
          itemCount: _pages.length,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted), label: "项目"),
          BottomNavigationBarItem(icon: Icon(Icons.group_work), label: "公众号"),
          BottomNavigationBarItem(icon: Icon(Icons.call_split), label: "体系"),
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_emoticon), label: "我的")
        ],
        currentIndex: _selectedIndex,
        enableFeedback: false,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
