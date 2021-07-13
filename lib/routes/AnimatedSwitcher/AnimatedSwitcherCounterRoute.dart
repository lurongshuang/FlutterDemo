import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SlideTransitionX.dart';

class AnimatedSwitcherCounterRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AnimatedSwitcherCounterRouteState();
  }
}

int _count = 0;
AxisDirection _axisDirection = AxisDirection.down;

class _AnimatedSwitcherCounterRouteState
    extends State<AnimatedSwitcherCounterRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedSwitcher"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      //放大缩小
                      // return ScaleTransition(
                      //   scale: animation,
                      //   child: child,
                      // );
                      //旋转
                      // return RotationTransition(
                      //   turns: animation,
                      //   child: child,
                      // );
                      var tween =
                          Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
                      // return SlideTransition(
                      //   child: child,
                      //   position: tween.animate(animation),
                      // );
                      //平移
                      // return MySlideTransition(
                      //   child: child,
                      //   position: tween.animate(animation),
                      // );
                      return SlideTransitionX(
                          direction: _axisDirection,
                          position: animation,
                          child: child);
                    },
                    child: Text(
                      "$_count",
                      key: ValueKey(_count),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _axisDirection = AxisDirection.down;
                          _count += 1;
                        });
                      },
                      child: Text("上入下出+1"),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _axisDirection = AxisDirection.up;

                        _count -= 1;
                      });
                    },
                    child: Text("下入上出-1"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _axisDirection = AxisDirection.right;

                          _count += 1;
                        });
                      },
                      child: Text("左入右出+1"),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _axisDirection = AxisDirection.left;

                        _count -= 1;
                      });
                    },
                    child: Text("右入左出-1"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
