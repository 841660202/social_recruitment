import 'package:flutter/material.dart';
import 'package:social_recruitment/constants/index.dart';
import 'package:social_recruitment/page/draw.dart';
import 'package:social_recruitment/page/tab-community/index.dart';
import 'package:social_recruitment/page/tab-home/index.dart';
import 'package:social_recruitment/page/tab-mine/index.dart';
import 'package:social_recruitment/page/tab-msg/index.dart';

class NavigationIconView {
  final BottomNavigationBarItem item;

  NavigationIconView(
      {Key key, String title, IconData icon, IconData activeIcon})
      : item = BottomNavigationBarItem(
          icon: Icon(icon),
          activeIcon: Icon(activeIcon),
          title: Text(title),
          backgroundColor: Colors.white,
        );
}

class TabNav extends StatefulWidget {
  final Widget child;
  TabNav({Key key, this.child}) : super(key: key);
  _TabNavState createState() => _TabNavState();
}

class _TabNavState extends State<TabNav> {
  PageController _pageController;
  int _currentIndex = 1;
  List<NavigationIconView> _navigationViews;
  List<Widget> _pages;
  void initState() {
    super.initState();
    _navigationViews = [
      NavigationIconView(
        title: '首页',
        icon: IconData(
          0xe651,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe651,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
          title: '消息',
          icon: IconData(
            0xe61b,
            fontFamily: Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe61b,
            fontFamily: Constants.IconFontFamily,
          )),
      NavigationIconView(
          title: '社区',
          icon: IconData(
            0xe686,
            fontFamily: Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe686,
            fontFamily: Constants.IconFontFamily,
          )),
      NavigationIconView(
          title: '我',
          icon: IconData(
            0xe6ee,
            fontFamily: Constants.IconFontFamily,
          ),
          activeIcon: IconData(
            0xe6ee,
            fontFamily: Constants.IconFontFamily,
          )),
    ];
    _pageController = PageController(initialPage: _currentIndex);
    _pages = [
      // 四个页面
      Home(),
      Msg(),
      Community(),
      Mine(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // 底部导航
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      // fixedColor: const Color(AppColors.TabIconActive),
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        // 点击
        setState(() {
          _currentIndex = index; // 选中的index

          _pageController.animateToPage(_currentIndex, // 设置动画
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut);
        });
      },
    );

    return Scaffold(
      //
      body: PageView.builder(
        // 每页显示的内容
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length, // 总共多少页
        onPageChanged: (int index) {
          // 滑动页面的回调函数
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
