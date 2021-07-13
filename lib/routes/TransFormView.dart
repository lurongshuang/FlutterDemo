import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransFormView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TransFormView();
  }
}

class _TransFormView extends State<TransFormView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Container(
                color: Colors.black,
                child: Transform(
                  alignment: Alignment.center,
                  transform: new Matrix4.skewY(0.3),
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    color: Colors.blueAccent,
                    child: Text("TransFrom Y轴倾斜0.3"),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Container(
                color: Colors.black,
                child: Transform.rotate(
                  alignment: Alignment.center,
                  angle: 1,
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    color: Colors.blueAccent,
                    child: Text("TransFrom 旋转"),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Container(
                color: Colors.black,
                child: Transform.scale(
                  alignment: Alignment.center,
                  scale: 2,
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    child: Text(
                      "TransFrom 放大两倍",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
                "Transform,变换是应用绘制阶段，而不是应用在布局阶段，所以无论子组件何种变换，其占用空间大小都是在屏幕上的位置固定不变的"),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: "RotatedBox",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.r)),
              TextSpan(
                  text:
                      "和Transform.rotate功能相似，它们都可以对子组件进行旋转变换，但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小。")
            ])),
          )
        ],
      ),
    );
  }
}
