import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @description 作用:
/// @date: 2021/6/25
/// @author:
class ContainerView extends StatefulWidget {
  ContainerView({Key key}) : super(key: key);

  @override
  _ContainerViewState createState() => _ContainerViewState();
}

class _ContainerViewState extends State<ContainerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Container"),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Container(
                  color: Colors.black,
                  child: Container(
                    width: 200.r,
                    height: 50.r,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.blue, Colors.orange[700]]),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              offset: Offset(2.0, 2.0),
                              blurRadius: 4.0,
                              spreadRadius: 1.0)
                        ]),
                    transform: Matrix4.skewY(0.3),
                    child: Center(
                      child: Text("Container"),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Container",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.r)),
                TextSpan(
                    text:
                        "它是DecoratedBox、ConstrainedBox、Transform、Padding、Align等组件组合的一个多功能容器，所以我们只需通过一个Container组件可以实现同时需要装饰、变换、限制的场景")
              ])),
            )
          ],
        ));
  }
}
