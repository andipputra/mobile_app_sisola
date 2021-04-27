import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_sisola/presenter/home/view/home_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MPage extends StatelessWidget {
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ('Home'),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ('Settings'),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  List<Widget> _page() {
    return [
      HomePage(
        isLogin: false,
      ),
      Container(
        child: Text('2'),
      ),
      Container(
        child: Text('3'),
      ),
      Container(
        child: Text('4'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(context,
        controller: _controller, screens: _page(), items: [],);
  }
}
