import 'package:flutter/material.dart';
import 'package:social_recruitment/components/recruit-info.dart';
import 'package:social_recruitment/constants/index.dart' show Constants;
import 'package:social_recruitment/page/draw.dart';
import '../../model/recruitInfo-list.dart'
    show RecruitInfoModel, RecruitInfoModelsPageData;

class Home extends StatefulWidget {
  final Widget child;

  Home({Key key, this.child}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final RecruitInfoModelsPageData data = RecruitInfoModelsPageData.mock();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawNav(),
      key: _scaffoldKey,
      appBar: AppBar(
        // leading: InkWell(
        //   onTap: () {
        //     _scaffoldKey.currentState.openDrawer();
        //   },
        //   child: ClipOval(
        //     child: Image.network(
        //       'https://avatar.csdn.net/B/5/2/3_web_longboss.jpg',
        //       width: 36.0,
        //       height: 36.0,
        //     ),
        //   ),
        // ),
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState.openDrawer();
          },
          child: Container(
            margin: EdgeInsets.all(8.0),
            child: new CircleAvatar(
              backgroundImage: new NetworkImage(
                'https://avatar.csdn.net/B/5/2/3_web_longboss.jpg',
              ),
            ),
          ),
        ),
        elevation: 0,
        title: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 6.0),
                height: 40.0,
                margin: EdgeInsets.only(left: 8.0),
                decoration: BoxDecoration(color: Color.fromARGB(30, 0, 0, 0)),
                child: Icon(Icons.search),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 6.0),
              height: 40.0,
              margin: EdgeInsets.only(left: 8.0),
              child: Icon(
                IconData(
                  0xe600,
                  fontFamily: Constants.IconFontFamily,
                ),
                size: 22.0,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Color.fromARGB(13, 0, 0, 0),
        child: Center(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return RecruitInfo(recruitInfoModel: data.list[index]);
            },
            itemCount: data.list.length,
          ),
        ),
      ),
    );
  }
}
