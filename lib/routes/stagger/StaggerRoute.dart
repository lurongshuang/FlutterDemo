import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'StaggerAnimation.dart';
import 'StaggerAnimation2.dart';

class StaggerRoute extends StatefulWidget {
  @override
  _StaggerRouteState createState() => _StaggerRouteState();
}

class _StaggerRouteState extends State<StaggerRoute>
    with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _controller2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _controller2 = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
  }

  Future<Null> _playAnimation() async {
    try {
      //先正向执行动画
      await _controller.forward().orCancel;
      //再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  Future<Null> _playAnimation2() async {
    try {
      //先正向执行动画
      await _controller2.forward().orCancel;
      //再反向执行动画
      await _controller2.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("交织动画"),
      ),
      body: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              _playAnimation();
            },
            child: Center(
              child: Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                //调用我们定义的交织动画Widget
                child: StaggerAnimation(controller: _controller),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _playAnimation2();
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(
                width: 300,
                height: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    border: Border.all(color: Colors.black.withOpacity(0.5))),
                child: StaggerAnimation2(
                  controller: _controller2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
