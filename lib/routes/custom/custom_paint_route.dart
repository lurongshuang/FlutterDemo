import 'dart:math';
import 'package:flutter/material.dart';

/// @description 作用: 绘制棋盘
/// @date: 2021/6/30
/// @author: lrs

class PieceBean {
  PieceBean(this.id, this.location, this.color);

  String id;
  Offset location;
  Color color;
}

class CustomPaintRoute extends StatelessWidget {
  List<PieceBean> _list;

  CustomPaintRoute(this._list);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(300, 300),
        painter: QpPainter(_list),
      ),
    );
  }
}

class QpPainter extends CustomPainter {
  List<PieceBean> _list;

  QpPainter(this._list);

  @override
  void paint(Canvas canvas, Size size) {
    int lines = 9;

    double eWidth = size.width / lines;
    double eHeight = size.height / lines;

    var paint = Paint();

    //棋盘背景
    paint.isAntiAlias = true;
    paint.style = PaintingStyle.fill;
    paint.color = Color(0x77cdb175);
    canvas.drawRect(Offset.zero & size, paint);

    //棋盘网格
    paint.style = PaintingStyle.stroke;
    paint.color = Colors.black87;
    paint.strokeWidth = 1.0;

    for (int i = 0; i <= lines; ++i) {
      //绘制竖线
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
      //绘制横线
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    //绘制所有位置
    paint.style = PaintingStyle.fill;
    paint.color = Colors.black;
    for (int i = 0; i <= lines; i++) {
      for (int j = 0; j <= lines; j++) {
        canvas.drawCircle(Offset(eWidth * i, eHeight * j),
            min(eWidth / 10, eHeight / 8) - 2, paint);
      }
    }

    if (_list != null && _list.length > 0) {
      _list.forEach((element) {
        //绘制棋子
        paint.style = PaintingStyle.fill;
        paint.color = element.color;
        canvas.drawCircle(
          Offset(eWidth * element.location.dx, eHeight * element.location.dy),
          min(eWidth / 2, eHeight / 2) - 2,
          paint,
        );
      });
    }

    // //画一个白子
    // paint.color = Colors.white;
    // canvas.drawCircle(
    //   Offset(eWidth * 2, eHeight * 1),
    //   min(eWidth / 2, eHeight / 2) - 2,
    //   paint,
    // );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
