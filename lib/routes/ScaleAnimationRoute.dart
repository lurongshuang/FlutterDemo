import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaleAnimationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ScaleAnimationRouteState();
  }
}

Animation<double> animation;
AnimationController animationController;

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animationController =
        new AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation = new Tween(begin: 0.0, end: 200.0).animate(animationController);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        animationController.forward();
      }
    });

    animationController.forward();
  }

  @override
  void deactivate() {
    animationController.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ScaleAnimation"),
        ),
        body: Center(
            child:
                //第一种写法
                // Image.asset(
                //   "assets/images/ic_head_def.png",
                //   width: animation.value,
                //   height: animation.value,
                // ),

                //第二种写法，进行封装组件
                //         AnimatedImage(
                //   animation: animation,
                //   src: "assets/images/ic_head_def.png",
                // )),
                //第三种写法 使用 AnimateBuilder
                // AnimatedBuilder(
                //     animation: animation,
                //     child: Image.asset("assets/images/ic_head_def.png"),
                //     builder: (BuildContext context, Widget child) {
                //       return new Center(
                //         child: Container(
                //           child: child,
                //           width: animation.value,
                //           height: animation.value,
                //         ),
                //       );
                //     })
                GrowTransition(
                    Image.asset("assets/images/ic_head_def.png"), animation)));
  }
}

// ignore: must_be_immutable
class GrowTransition extends StatelessWidget {
  GrowTransition(this.child, this.animated);

  Widget child;
  Animation<double> animated;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: this.animated,
          builder: (BuildContext context, Widget child) {
            return Container(
              child: this.child,
              height: this.animated.value,
              width: this.animated.value,
            );
          }),
    );
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation, this.src})
      : super(key: key, listenable: animation);
  String src;

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset(src, width: animation.value, height: animation.value),
    );
  }
}
