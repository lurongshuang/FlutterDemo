import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaggerAnimation2 extends StatelessWidget {
  final Animation<double> controller;

  Animation<double> parWidth;
  Animation<double> childWidth;
  Animation<Color> color;
  Animation<double> paddingLeft;
  Animation<double> paddingRight;

  StaggerAnimation2({Key key, this.controller}) : super(key: key) {
    //父级宽高变换
    parWidth = Tween(begin: 0.0, end: 300.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.3, curve: Curves.easeInQuint)));

    //子级宽高变换
    childWidth = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.3, 0.6, curve: Curves.easeInQuint)));

    color = ColorTween(
      begin: Colors.blue,
      end: Colors.greenAccent,
    ).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.3, 0.6, curve: Curves.ease)));

    paddingLeft = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.6, 0.8)));

    paddingRight = Tween(begin: 0.0, end: 100.0).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.8, 1.0)));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Container(
            padding: EdgeInsets.fromLTRB(
                paddingLeft.value - paddingRight.value, 0, 0, 0),
            color: color.value,
            alignment: Alignment.center,
            width: parWidth.value,
            height: parWidth.value,
            child: Image.asset(
              "assets/images/ic_head_def.png",
              width: childWidth.value,
              height: childWidth.value,
            ),
          );
        });
  }
}
