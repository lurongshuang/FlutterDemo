import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/routes/custom/loading_dialog.dart';

/// @description 作用:httpClient 请求测试
/// @date: 2021/7/1
/// @author:lrs
class HttpTestRoute extends StatefulWidget {
  HttpTestRoute({Key key}) : super(key: key);

  @override
  _HttpTestRouteState createState() => _HttpTestRouteState();
}

class _HttpTestRouteState extends State<HttpTestRoute> {
  String jsonTest = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HttpClient"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () {
                    getJsonData();
                  },
                  child: Text("获取数据"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(jsonTest.replaceAll(new RegExp(r"\s"), "")),
              ),
            )
          ],
        ),
      ),
    );
  }

  void getJsonData() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return LoadingDialog(loadText: "加载中..");
        });

    try {
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request =
          await httpClient.getUrl(Uri.parse("https://www.baidu.com"));
      request.headers.add("user-agent",
          "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");

      HttpClientResponse response = await request.close();
      String data = await response.transform(utf8.decoder).join();
      setState(() {
        jsonTest = data.substring(0, 3000);
      });
      httpClient.close();
    } catch (e) {
      setState(() {
        jsonTest = "请求失败" + e.toString();
      });
    } finally {
      Navigator.of(context).pop();
    }
  }
}
