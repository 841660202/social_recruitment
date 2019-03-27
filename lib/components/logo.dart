import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final Widget child;

  Logo({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: Color.fromARGB(190, 255, 255, 255),
    //   child: Stack(
    //     children: <Widget>[
    //       Container(
    //         margin: EdgeInsets.only(top: 60.0, left: 80.0, right: 80.0),
    //         child: null,
    //         decoration: BoxDecoration(
    //           border: Border(
    //             bottom: BorderSide(
    //                 color: Colors.grey[300], width: Constants.DividerWidth),
    //           ),
    //         ),
    //       ),
    //       Container(
    //         margin: EdgeInsets.only(top: 48.0),
    //         alignment: Alignment.center,
    //         child: Text(
    //           '海纳科技版权所有',
    //           style: TextStyle(
    //               color: Colors.grey[300],
    //               fontSize: 18,
    //               backgroundColor: Color.fromARGB(255, 250, 250, 250)),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    return Container(
      color: Color.fromARGB(255, 250, 250, 250),
      height: 80.0,
      alignment: Alignment.center,
      child: Text('海纳科技版权所有',style: TextStyle(color: Colors.black38),),
    );
  }
}
