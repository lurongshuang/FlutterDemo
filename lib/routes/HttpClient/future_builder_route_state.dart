import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'dio/dio_web_view.dart';

/// @description 作用: dio 请求
/// @date: 2021/7/1
/// @author:lrs
class FutureBuilderRouteState extends StatefulWidget {
  FutureBuilderRouteState({Key key}) : super(key: key);

  @override
  _FutureBuilderRouteStateState createState() =>
      _FutureBuilderRouteStateState();
}

class _FutureBuilderRouteStateState extends State<FutureBuilderRouteState> {
  Dio _dio = new Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dio请求"),
      ),
      body: Material(
        child: FutureBuilder(
            future: _dio.get("https://wanandroid.com/wxarticle/list/408/1/json",
                queryParameters: {
                  "perid": -1,
                  "page": 1,
                  "limit": 50,
                  "a": "",
                  "token": "6A5BAD08A3D102CCE66A70479F221C0C"
                }),
            builder: (BuildContext context, AsyncSnapshot snapshop) {
              if (snapshop.connectionState == ConnectionState.done) {
                //请求完成
                Response response = snapshop.data;
                String a = snapshop.data.toString();
                //发生错误
                if (snapshop.hasError) {
                  return Text(snapshop.error.toString());
                }
                // Map<String, dynamic> jsonBean = jsonDecode(snapshop.data.data);
                Map<String, dynamic> jsonBean =
                    new Map<String, dynamic>.from(snapshop.data.data);
                List<dynamic> jsonList = jsonBean["data"]["datas"];
                if (jsonList == null) {
                  return Center(
                    child: Text("暂无数据"),
                  );
                }
                //返回正常
                return ListView.builder(
                  itemCount: jsonList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("${jsonList[index]["title"]}"),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return DioWebView(
                            lingks: jsonList[index]["link"],
                          );
                        }));
                      },
                    );
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}

class NewsBean {
  int ID;
  String TZTITLE;

  NewsBean(this.ID, this.TZTITLE);

  factory NewsBean.fromJson(Map<String, dynamic> json) {
    return NewsBean(json["ID"], json["TZTITLE"]);
  }
}
