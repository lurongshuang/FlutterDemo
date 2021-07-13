import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/routes/base/BaseStatefulWidget.dart';
import 'package:flutter_app_demo/routes/homeBar/page2/card_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Page2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Page2();
  }
}

var title = '服务';

class _Page2 extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return BaseStatefulWidget(
      title: '$title',
      child: Center(
        child: ListView(
          padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
          children: [
            Card(
              elevation: 2,
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "交费业务",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.r),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(
                        children: [
                          CardItem("assets/images/ic_head_def.png", "在线交费"),
                          CardItem("assets/images/ic_head_def.png", "交费记录"),
                          CardItem("assets/images/ic_head_def.png", "在线交费"),
                          CardItem("assets/images/ic_head_def.png", "交费记录"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(padding: EdgeInsets.all(5)),
            Card(
              elevation: 2,
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "交费业务",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.r),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(
                        children: [
                          CardItem("assets/images/ic_head_def.png", "在线交费"),
                          CardItem("assets/images/ic_head_def.png", "交费记录"),
                          CardItem("assets/images/ic_head_def.png", "在线交费"),
                          CardItem("", ""),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(padding: EdgeInsets.all(5)),
            Card(
              elevation: 2,
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "交费业务",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.r),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(
                        children: [
                          CardItem("assets/images/ic_head_def.png", "在线交费"),
                          CardItem("assets/images/ic_head_def.png", "交费记录"),
                          CardItem("", ""),
                          CardItem("", ""),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(padding: EdgeInsets.all(5)),
            Card(
              elevation: 2,
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "交费业务",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.r),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(
                        children: [
                          CardItem("assets/images/ic_head_def.png", "在线交费"),
                          CardItem("assets/images/ic_head_def.png", "交费记录"),
                          CardItem("assets/images/ic_head_def.png", "交费记录"),
                          CardItem("", ""),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(padding: EdgeInsets.all(5)),
            Card(
              elevation: 2,
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "交费业务",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.r),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(
                        children: [
                          CardItem("assets/images/ic_head_def.png", "在线交费"),
                          CardItem("assets/images/ic_head_def.png", "交费记录"),
                          CardItem("assets/images/ic_head_def.png", "交费记录"),
                          CardItem("", ""),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
