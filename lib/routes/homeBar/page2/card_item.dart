import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @description 作用:
/// @date: 2021/6/23
/// @author:lrs
class CardItem extends StatelessWidget {
  String imgSrc;
  String title;

  CardItem(this.imgSrc, this.title);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Center(
          child: Column(
            children: [
              if (imgSrc.length > 0)
                Image.asset(
                  imgSrc,
                  width: 50.r,
                  height: 50.r,
                ),
              Container(
                margin: EdgeInsets.all(2),
              ),
              if (title.length > 0)
                Text(
                  title,
                  style: TextStyle(fontSize: 13),
                )
            ],
          ),
        ));
  }
}
