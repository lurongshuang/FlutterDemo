import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/routes/Route/route_page2.dart';
import 'FadeRoute.dart';
import 'ScaleRoute.dart';
import 'SizeRoute.dart';
import 'SlideRoute.dart';

/// @description 作用:
/// @date: 2021/6/28
/// @author:lrs
class RoutePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("跳转切换"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                //使用PageRouteBuilder跳转
                // Navigator.push(
                //     context,
                //     PageRouteBuilder(
                //         transitionDuration: Duration(milliseconds: 500),
                //         pageBuilder: (BuildContext context, Animation animation,
                //             Animation secondaryAnimation) {
                //           return new FadeTransition(
                //             opacity: animation,
                //             child: RoutePage2(),
                //           );
                //         }));
                //封装跳转
                Navigator.push(context, FadeRoute(builder: (context) {
                  return RoutePage2();
                }));
              },
              child: Text("Fade跳转"),
            ),
            RaisedButton(
              onPressed: () {
                //使用PageRouteBuilder跳转
                // Navigator.push(
                //     context,
                //     PageRouteBuilder(
                //         transitionDuration: Duration(milliseconds: 500),
                //         pageBuilder: (BuildContext context, Animation animation,
                //             Animation secondaryAnimation) {
                //           return new FadeTransition(
                //             opacity: animation,
                //             child: RoutePage2(),
                //           );
                //         }));
                //封装跳转
                Navigator.push(context, ScaleRoute(builder: (context) {
                  return RoutePage2();
                }));
              },
              child: Text("Scale跳转"),
            ),
            RaisedButton(
              onPressed: () {
                //使用PageRouteBuilder跳转
                // Navigator.push(
                //     context,
                //     PageRouteBuilder(
                //         transitionDuration: Duration(milliseconds: 500),
                //         pageBuilder: (BuildContext context, Animation animation,
                //             Animation secondaryAnimation) {
                //           return new FadeTransition(
                //             opacity: animation,
                //             child: RoutePage2(),
                //           );
                //         }));
                //封装跳转
                Navigator.push(context, SizeRoute(builder: (context) {
                  return RoutePage2();
                }));
              },
              child: Text("Size跳转"),
            ),
            RaisedButton(
              onPressed: () {
                //使用PageRouteBuilder跳转
                // Navigator.push(
                //     context,
                //     PageRouteBuilder(
                //         transitionDuration: Duration(milliseconds: 500),
                //         pageBuilder: (BuildContext context, Animation animation,
                //             Animation secondaryAnimation) {
                //           return new FadeTransition(
                //             opacity: animation,
                //             child: RoutePage2(),
                //           );
                //         }));
                //封装跳转
                Navigator.push(context, RotationRoute(builder: (context) {
                  return RoutePage2();
                }));
              },
              child: Text("Rotation跳转"),
            )
          ],
        ),
      ),
    );
  }
}
