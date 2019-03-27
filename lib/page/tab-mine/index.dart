import 'package:flutter/material.dart';
import 'package:social_recruitment/components/full-width-button.dart';
import 'package:social_recruitment/components/logo.dart';
import 'package:social_recruitment/constants/index.dart'
    show Constants, iconTexts;

class Mine extends StatefulWidget {
  final Widget child;

  Mine({Key key, this.child}) : super(key: key);

  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  static const SEPARATE_SIZE = 20.0;

  // 操作-常用
  Widget _buildHeadBottomNav() {
    List<Widget> headBottomNavs = [];
    for (var item in iconTexts) {
      headBottomNavs
        ..add(
          Container(
            child: Column(
              children: <Widget>[
                Icon(
                  IconData(
                    item.codePoint,
                    fontFamily: Constants.IconFontFamily,
                  ),
                  color: Colors.white,
                  size: 22.0,
                ),
                SizedBox(height: 6.0),
                Text(
                  item.title,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        );
    }
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: headBottomNavs,
      ),
    );
  }

  // 头部
  Widget _buildHead() {
    return Container(
      color: Color.fromARGB(13, 0, 0, 0),
      child: Stack(
        children: <Widget>[
          Image.asset('assets/images/bg.png'),
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 60.0),
                alignment: Alignment.center,
                child: ClipOval(
                  child: Image.network(
                    'https://avatars1.githubusercontent.com/u/18305361?s=460&v=4',
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      '陈海龙',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    Text(
                      '前端工程师',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              _buildHeadBottomNav(),
            ],
          )
        ],
      ),
    );
  }

  // 组点击
  Widget _buildFullBtn() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: SEPARATE_SIZE),
          FullWidthButton(
            codePoint: 0xe607,
            title: '求职意向',
            showDivider: true,
            onPressed: () {},
          ),
          FullWidthButton(
            codePoint: 0xe667,
            title: '我的猎头',
            onPressed: () {},
          ),
          SizedBox(height: SEPARATE_SIZE),
          FullWidthButton(
            codePoint: 0xe666,
            title: '隐私',
            showDivider: true,
            onPressed: () {
              print('点击了隐私');
            },
          ),
          FullWidthButton(
            codePoint: 0xe667,
            title: '通知',
            onPressed: () {},
          ),
          SizedBox(height: SEPARATE_SIZE),
          FullWidthButton(
            codePoint: 0xe622,
            title: '设置',
            showDivider: true,
            onPressed: () {},
          ),
          FullWidthButton(
            codePoint: 0xe60d,
            title: '求助/反馈',
            onPressed: () {},
          ),
          SizedBox(height: SEPARATE_SIZE),
        ],
      ),
    );
  }

// 主体
  Widget _buildBody() {
    return Container(
      color: Color.fromARGB(13, 0, 0, 0),
      child: Column(
        children: <Widget>[
          _buildHead(),
          _buildFullBtn(),
          Logo(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: _buildBody(),
      ),
    );
  }
}
