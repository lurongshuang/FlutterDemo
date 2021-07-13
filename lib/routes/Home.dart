import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/routes/homeBar/Page1.dart';
import 'package:flutter_app_demo/routes/homeBar/Page2.dart';
import 'package:flutter_app_demo/routes/homeBar/Page3.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Home();
  }
}

List<BottomNavigationBarItem> barItems = [
  BottomNavigationBarItem(
      backgroundColor: Colors.blue, icon: Icon(Icons.home), title: Text('首页')),
  BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: Icon(Icons.wifi),
      title: Text('Card组件')),
  BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: Icon(Icons.av_timer_rounded),
      title: Text(
        '组件合集',
      ))
];

List<Widget> pages = [Page1(), Page2(), Page3()];
var currentIndex = 0;
DateTime _lastPressedAt; //上次点击时间

class _Home extends State<Home> {
  @override
  void initState() {
    super.initState();
    debugPrint("本机系统：$defaultTargetPlatform");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 55.r,
        child: BottomNavigationBar(
          iconSize: 18.r,
          selectedFontSize: 14.r,
          unselectedFontSize: 12.r,
          items: barItems,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            _changePage(index);
          },
        ),
      ),
      body: WillPopScope(
          child: Center(
            child: IndexedStack(
              children: pages,
              index: currentIndex,
            ),
          ),
          onWillPop: () async {
            if (_lastPressedAt == null ||
                DateTime.now().difference(_lastPressedAt) >
                    Duration(seconds: 1)) {
              //两次点击间隔超过1秒则重新计时
              _lastPressedAt = DateTime.now();
              Fluttertoast.showToast(msg: "再按一次退出程序");
              return false;
            }
            return true;
          }),
    );
  }

  /*切换页面*/
  void _changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
