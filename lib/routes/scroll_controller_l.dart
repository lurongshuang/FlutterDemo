import 'package:flutter/material.dart';

/// @description 作用:
/// @date: 2021/6/25
/// @author:lrs
class ScrollControllerL extends StatefulWidget {
  ScrollControllerL({Key key}) : super(key: key);

  @override
  _ScrollControllerLState createState() => _ScrollControllerLState();
}

class _ScrollControllerLState extends State<ScrollControllerL> {
  ScrollController _scrollController = new ScrollController();
  bool showToTopBtn = false;
  String progess = "0";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_scrollController.offset >= 1000 && !showToTopBtn) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void deactivate() {
    _scrollController.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollController"),
      ),
      body: Scrollbar(
          child: NotificationListener(
              onNotification: (ScrollNotification notification) {
                double pro = notification.metrics.pixels /
                    notification.metrics.maxScrollExtent;
                setState(() {
                  progess = "${(pro * 100).toInt()}%";
                });
                return false;
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ListView.builder(
                      itemCount: 100,
                      controller: _scrollController,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text("滑动超过1000像素后显示-回到顶部$index"),
                        );
                      }),
                  CircleAvatar(
                    radius: 30.0,
                    child: Text(
                      progess,
                      style: TextStyle(color: Colors.blue),
                    ),
                    backgroundColor: Colors.black54,
                  )
                ],
              ))),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _scrollController.animateTo(.0,
                    duration: Duration(milliseconds: 2000),
                    curve: Curves.easeInQuint);
              }),
    );
  }
}
