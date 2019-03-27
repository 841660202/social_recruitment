import 'package:flutter/material.dart';
import 'dart:async';

import 'package:social_recruitment/util/HttpUtils.dart';
import 'package:social_recruitment/util/update-app.dart';
import 'package:flutter_update/flutter_update.dart';
class Msg extends StatefulWidget {
  final Widget child;

  Msg({Key key, this.child}) : super(key: key);

  _MsgState createState() => _MsgState();
}

class _MsgState extends State<Msg> {
  TabController _tabController;

  @override
  void initState() {
    fetchData();
  }

  Future<void> fetchData() async {
    var result =
        await HttpUtils.request('/appVersion', method: HttpUtils.GET, data: {});
    print(result);
  }

  Future<void> handleDownload() async {
    // AppUpdate app = new AppUpdate();
    // await app.executeDownload();
    FlutterUpdate.install('https://test1.4q.sk/flutter_hello_world.apk','/storage/emulated/0/app.apk');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: DefaultTabController(
            length: 3,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3,
              indicatorPadding: EdgeInsets.fromLTRB(8, 0, 8, 5),
              tabs: [
                Tab(text: '聊天'),
                Tab(text: '互动'),
                Tab(text: '通知'),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.file_download),
          onPressed: () {
            handleDownload();
          }),
    );
  }
}
