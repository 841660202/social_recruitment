import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  final Widget child;

  Community({Key key, this.child}) : super(key: key);

  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: DefaultTabController(
            length: 4,
            child: TabBar(
              labelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3,
              indicatorPadding: EdgeInsets.fromLTRB(8, 0, 8, 5),
              tabs: [
                Tab(text: '博文'),
                Tab(text: '面试'),
                Tab(text: '视频'),
                Tab(text: '充电'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}