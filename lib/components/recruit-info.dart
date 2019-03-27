import 'package:flutter/material.dart';
import 'package:social_recruitment/model/recruitInfo-list.dart';
import 'dart:ui';

class RecruitInfo extends StatelessWidget {
  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
  static double _width = mediaQuery.size.width;
  static double _height = mediaQuery.size.height;
  static double _topbarH = mediaQuery.padding.top;
  static double _botbarH = mediaQuery.padding.bottom;
  final Widget child;
  // final String title; // 标题
  // final String city; // 市
  // final String area; // 区
  // final List<num> seniority; // 工龄
  // final String educationalLeve; // 学历
  // final List<num> salary; // avatar
  // final String date;
  // final List<num> jobType;
  // final String enterpriseAvatar;
  // final String enterpriseName;
  // final String enterpriseFinancing; // 企业融资
  // final List<num> enterpriseSize; // 企业规模员工数
  // final List<String> enterpriseType; // 企业类型
  final RecruitInfoModel recruitInfoModel;
  RecruitInfo({
    Key key,
    this.child,
    @required this.recruitInfoModel,
    // @required this.title,
    // @required this.city,
    // @required this.area,
    // @required this.seniority,
    // @required this.educationalLeve,
    // @required this.salary,
    // @required this.date,
    // @required this.jobType,
    // @required this.enterpriseAvatar,
    // @required this.enterpriseName,
    // @required this.enterpriseFinancing,
    // @required this.enterpriseSize,
    // @required this.enterpriseType,
  }) : super(key: key);

  Widget _buildSeniority() {
    List<Widget> senioritys = [];
    senioritys.add(new Text('${recruitInfoModel.seniority[0]}年-'));
    senioritys.add(new Text('${recruitInfoModel.seniority[1]}年'));
    return Row(
      children: senioritys,
    );
  }

  // 职位类型
  List<String> types = [
    '移动互联网',
    '视频',
    '移动端',
  ];
  Widget _buildJobType() {
    List<Widget> jobTypes = [];
    for (var item in recruitInfoModel.jobType) {
      jobTypes.add(Container(
        padding: EdgeInsets.only(left: 6.0, right: 6.0, top: 2.0, bottom: 2.0),
        margin: EdgeInsets.only(right: 8.0, top: 12.0, bottom: 12.0),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
        child: new Text('${types[item]}'),
      ));
    }
    return Row(
      children: jobTypes,
    );
  }

// 薪水
  Widget _buildSalary() {
    List<Widget> salarys = [];
    salarys.add(new Text(
      '${recruitInfoModel.salary[0]}K-',
      style: TextStyle(color: Colors.orange[300], fontSize: 19.0),
    ));
    salarys.add(new Text(
      '${recruitInfoModel.salary[1]}K',
      style: TextStyle(color: Colors.orange[300], fontSize: 19.0),
    ));

    return Row(
      children: salarys,
    );
  }

  Widget _buildDevider() {
    return Container(
      width: 2.0,
      height: 12.0,
      color: Colors.grey[300],
      margin: EdgeInsets.only(left: 4.0, right: 4.0),
    );
  }

// 招聘基本信息
  Widget _buildRecruitBase() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                recruitInfoModel.title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  child: Text(recruitInfoModel.city),
                ),
                _buildDevider(),
                Container(
                  child: Text(recruitInfoModel.area),
                ),
                _buildDevider(),
                Container(
                  child: _buildSeniority(),
                ),
                _buildDevider(),
                Container(
                  child: Text(recruitInfoModel.educationalLeve),
                ),
              ],
            )
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              child: _buildSalary(),
            ),
            Container(
              child: Text(recruitInfoModel.date),
            ),
          ],
        ),
      ],
    );
  }

// 企业规模
  Widget _buildEnterpriseSize() {
    List<Widget> enterpriseSizes = [];
    enterpriseSizes.add(new Text('${recruitInfoModel.enterpriseSize[0]}-'));
    enterpriseSizes.add(new Text('${recruitInfoModel.enterpriseSize[1]}'));

    return Row(
      children: enterpriseSizes,
    );
  }

// 企业类型
  Widget _buildEnterpriseType() {
    List<Widget> enterpriseTypes = [];
    // for (var item in recruitInfoModel.enterpriseType) {
    //   enterpriseTypes.add(new Text('$item'));
    // }
    for (var i = 0; i < recruitInfoModel.enterpriseType.length; i++) {
      enterpriseTypes.add(new Text('${recruitInfoModel.enterpriseType[i]}'));
      if (i < recruitInfoModel.enterpriseType.length - 1) {
        enterpriseTypes.add(_buildDevider());
      }
    }
    return Row(
      children: enterpriseTypes,
    );
  }

// 企业
  Widget _buildEnterprise() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 6.0),
            child: Image.network(recruitInfoModel.enterpriseAvatar,
                width: 50.0, height: 50.0),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    recruitInfoModel.enterpriseName,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, //撑不起来
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: _buildEnterpriseSize(),
                            ),
                            _buildDevider(),
                            Container(
                              child: _buildEnterpriseType(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // 关闭按钮
                      width: 30.0,
                      child: Icon(
                        Icons.close,
                        size: 12.0,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      color: Colors.white,
      margin: EdgeInsets.only(top: 6.0, right: 8.0, bottom: 6.0, left: 8.0),
      padding: EdgeInsets.only(top: 6.0, right: 8.0, bottom: 6.0, left: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildRecruitBase(),
          _buildJobType(),
          _buildEnterprise()
        ],
      ),
    );
  }
}
