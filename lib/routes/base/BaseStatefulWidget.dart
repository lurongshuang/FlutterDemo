import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @description 作用: Widget基类
/// @date: 2021/7/6
/// @author:lrs
class BaseStatefulWidget extends StatefulWidget {
  BaseStatefulWidget({this.title, this.actions, this.child});

  String title;
  List<Widget> actions;
  Widget child;

  @override
  _BaseStatefulWidgetState createState() => _BaseStatefulWidgetState();
}

class _BaseStatefulWidgetState extends State<BaseStatefulWidget> {
  var toolbarHeight = 46.r;
  var titleFontSize = 18.r;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: toolbarHeight,
        centerTitle: true,
        title: Text(
          '${widget.title}',
          style: TextStyle(fontSize: titleFontSize),
        ),
        actions: widget.actions,
      ),
      body: widget.child,
    );
  }
}
