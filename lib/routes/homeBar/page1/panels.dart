import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/// @description 作用:
/// @date: 2021/6/22
/// @author: lrs
class Panels extends StatelessWidget {
  String title;

  Panels(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      child: Row(
        children: [
          Expanded(
            child: Align(
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.r),
              ),
              alignment: Alignment.centerLeft,
            ),
          ),
          Expanded(
            child: Align(
              child: Text(
                '更多>',
                style: TextStyle(color: Colors.grey, fontSize: 13.r),
              ),
              alignment: Alignment.centerRight,
            ),
          )
        ],
      ),
    );
  }
}
