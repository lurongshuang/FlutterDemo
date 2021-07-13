import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_demo/routes/base/BaseStatefulWidget.dart';
import 'package:flutter_app_demo/routes/homeBar/Page2.dart';
import 'package:flutter_app_demo/routes/homeBar/page1/NewsItem.dart';
import 'package:flutter_app_demo/routes/homeBar/page1/PersonnelItem.dart';
import 'package:flutter_app_demo/routes/homeBar/page1/company_item.dart';
import 'package:flutter_app_demo/routes/homeBar/page1/panels.dart';
import 'package:flutter_app_demo/routes/homeBar/page1/swiperImg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Page1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Page1();
  }
}

var title = '首页';
List<String> swiperList = [
  'https://pics2.baidu.com/feed/b03533fa828ba61eb9e5ad18dcfe2402314e59d4.jpeg?token=ea7c18eb8a375c52552355dd42085df8',
  'https://pics3.baidu.com/feed/37d12f2eb9389b50b760e9f018ff56d5e5116ecc.jpeg?token=32f97783665c51bcb32074d2b73af910'
];

List<News> newsList = [
  News(
      "关于会员服务系统手机APP上线通知关于会员服务系统手机APP上线通知关于会员服务系统手机APP上线通知关于会员服务系统手机APP上线通知关于会员服务系统手机APP上线通知",
      "2021年6月15日 12:46"),
  News("中价协关于交纳2021年度会费事宜的通知", "2021年6月15日 12:46"),
  News(
      "关于会员服务系统手机APP上线通知关于会员服务系统手机APP上线通知关于会员服务系统手机APP上线通知关于会员服务系统手机APP上线通知关于会员服务系统手机APP上线通知",
      "2021年6月15日 12:46"),
  News("中价协关于交纳2021年度会费事宜的通知", "2021年6月15日 12:46")
];
//提取出来 为了 setState 不重新绘制页面
var _futureBuilderFuture;

class _Page1 extends State<Page1> {
  @override
  void initState() {
    _futureBuilderFuture = mockNetworkData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseStatefulWidget(
      title: '$title',
      actions: [
        IconButton(
          iconSize: 20.r,
          icon: const Icon(Icons.message_outlined),
          tooltip: '消息',
          onPressed: () {
            // handle the press
          },
        ),
      ],
      child: Center(
        child: FutureBuilder(
            future: _futureBuilderFuture,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              // 请求已结束
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  // 请求失败，显示错误
                  return Text("Error: ${snapshot.error}");
                } else {
                  // 请求成功，显示数据
                  return getView();
                }
              } else {
                // 请求未结束，显示loading
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }

  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () {
      return "2";
    });
  }

  Widget getView() {
    return ListView(
      children: [
        Container(
          height: 10.r,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10.r),
          width: MediaQuery.of(context).size.width,
          height: 150.r,
          child: SwiperImg(swiperList),
        ),
        Panels("通知&新闻"),
        Divider(color: Colors.black26, height: 1.r),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: newsList.length,
          itemBuilder: (BuildContext context, int index) {
            return NewsItem(newsList[index]);
          },
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 10,
          margin: EdgeInsets.fromLTRB(0, 10.r, 0, 0),
          color: Color.fromRGBO(241, 240, 246, 1),
        ),
        Panels("资深会员"),
        Divider(color: Colors.black26, height: 1.r),
        ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return PersonnelItem();
            }),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 10,
          margin: EdgeInsets.fromLTRB(0, 10.r, 0, 0),
          color: Color.fromRGBO(241, 240, 246, 1),
        ),
        Panels("单位会员"),
        Divider(color: Colors.black26, height: 1.r),
        ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return CompanyItem();
            }),
      ],
    );
  }
}
