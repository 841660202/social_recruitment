import 'package:flutter/material.dart';

import '../constants/index.dart' show Constants, AppColors;

class FullWidthButton extends StatelessWidget {
  static const HORIZONTAL_PADDING = 20.0;
  static const VERTICAL_PADDING = 13.0;

  const FullWidthButton(
      {@required this.codePoint,
      @required this.title,
      this.showDivider: false,
      @required this.onPressed})
      : assert(codePoint != null),
        assert(title != null),
        assert(onPressed != null);

  final int codePoint;
  final String title;
  final bool showDivider;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final pureButton = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // Image.asset(
        //   codePoint,
        //   width: Constants.FullWidthIconButtonIconSize,
        //   height: Constants.FullWidthIconButtonIconSize,
        // ),
        Icon(
          IconData(
            codePoint,
            fontFamily: Constants.IconFontFamily,
          ),
          color: Colors.blue,
          size: 22.0,
        ),
        SizedBox(width: HORIZONTAL_PADDING),
        Text(title)
      ],
    );
    // 边框按钮由不带边框按钮和边框两部分组成
    final borderedButton = Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: const Color(AppColors.DividerColor),
                  width: Constants.DividerWidth))),
      padding: const EdgeInsets.only(bottom: VERTICAL_PADDING),
      child: pureButton,
    );
    return FlatButton(
      onPressed: onPressed,
      padding: EdgeInsets.only(
          left: HORIZONTAL_PADDING,
          right: HORIZONTAL_PADDING,
          top: VERTICAL_PADDING,
          bottom: this.showDivider ? 0.0 : VERTICAL_PADDING),
      color: Colors.white,
      child: this.showDivider ? borderedButton : pureButton,
    );
  }
}
