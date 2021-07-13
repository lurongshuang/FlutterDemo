import 'package:flutter/material.dart';

import 'custom_paint_route.dart';
/// @description 作用: 棋盘
/// @date: 2021/6/30
/// @author:lrs
class QPCustomPaintRoute extends StatefulWidget {
  QPCustomPaintRoute({Key key}) : super(key: key);

  @override
  _QPCustomPaintRouteState createState() => _QPCustomPaintRouteState();
}

class _QPCustomPaintRouteState extends State<QPCustomPaintRoute> {
  List<PieceBean> _list = new List();

  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("棋盘"),
      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("白棋"),
                      Radio(
                          value: 0,
                          groupValue: groupValue,
                          onChanged: (v) {
                            setState(() {
                              this.groupValue = v;
                            });
                          })
                    ],
                  ),
                  Row(
                    children: [
                      Text("黑棋"),
                      Radio(
                          value: 1,
                          groupValue: groupValue,
                          onChanged: (v) {
                            setState(() {
                              this.groupValue = v;
                            });
                          })
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              child: GestureDetector(
                child: CustomPaintRoute(_list),
                onTapUp: (TapUpDetails details) {
                  double x = double.parse(
                      (details.localPosition.dx / 30).floor().toString());
                  double y = double.parse(
                      (details.localPosition.dy / 30).floor().toString());
                  if (x >= 10.0) {
                    x = 9.0;
                  }
                  if (y >= 10.0) {
                    y = 9.0;
                  }
                  setState(() {
                    _list.add(PieceBean("${x}_$y", new Offset(x, y),
                        groupValue == 0 ? Colors.white : Colors.black));
                  });
                },
              ),
              width: 300,
              height: 300,
            )
          ],
        ),
      ),
    );
  }
}
