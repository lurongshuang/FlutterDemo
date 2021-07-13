import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PointerEvent _event;
double _top = 0.0; //距顶部的偏移
double _left = 0.0; //距左边的偏移

class Listeners extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Listeners();
  }
}

class _Listeners extends State<Listeners> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listener")),
      body: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Listener(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: 300.0,
                  height: 150.0,
                  child: Text(_event?.toString() ?? "",
                      style: TextStyle(color: Colors.white)),
                ),
                onPointerDown: (PointerDownEvent event) =>
                    setState(() => _event = event),
                onPointerMove: (PointerMoveEvent event) =>
                    setState(() => _event = event),
                onPointerUp: (PointerUpEvent event) =>
                    setState(() => _event = event),
              )),
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text("拖动")),
              //手指按下时会触发此回调
              onPanDown: (DragDownDetails e) {
                //打印手指按下的位置(相对于屏幕)
                print("用户手指按下：${e.globalPosition}");
              },
              //手指滑动时会触发此回调
              onPanUpdate: (DragUpdateDetails e) {
                //用户手指滑动时，更新偏移，重新构建
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e) {
                //打印滑动结束时在x、y轴上的速度
                print(e.velocity);
              },
            ),
          ),
        ],
      ),
    );
  }
}
