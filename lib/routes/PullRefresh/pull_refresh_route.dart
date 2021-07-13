import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_demo/routes/base/BaseStatefulWidget.dart';
/// @description 作用:
/// @date: 2021/7/7
/// @author:lrs
class PullRefreshRoute extends StatefulWidget {
  PullRefreshRoute({Key key}) : super(key: key);

  @override
  _PullRefreshRouteState createState() => _PullRefreshRouteState();
}

class _PullRefreshRouteState extends State<PullRefreshRoute> {
  int itemCount = 15;
  int maxCount = 100;
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        //滑动到了底部
        loadMoreDate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseStatefulWidget(
      title: "下拉刷新",
      child: RefreshIndicator(
          child: ListView.builder(
              controller: _controller,
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                if (index >= maxCount - 1) {
                  return noMoreView();
                }
                if (index == itemCount - 1) {
                  return loadMoreView();
                } else {
                  return ListTile(
                    title: Text("列表item-$index"),
                  );
                }
              }),
          onRefresh: () {
            return Future.delayed(Duration(seconds: 2), () {
              setState(() {
                itemCount = 15;
              });
            });
          }),
    );
  }

  //加载更多
  Future<Null> loadMoreDate() {
    return Future.delayed(Duration(seconds: 1), () {
      setState(() {
        if (itemCount < maxCount) {
          itemCount += 10;
        }
        if (itemCount > maxCount) {
          itemCount = maxCount;
        }
      });
    });
  }

  Widget loadMoreView() {
    return Center(
      child: Container(
        color: Color.fromRGBO(245, 245, 245, 1),
        padding: EdgeInsets.only(top: 15, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "加载中...",
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget noMoreView() {
    return Center(
      child: Container(
        color: Color.fromRGBO(245, 245, 245, 1),
        padding: EdgeInsets.only(top: 15, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.cancel,
              size: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "没有更多数据了",
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
