import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/routes/custom/loading_dialog.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// @description 作用: webView
/// @date: 2021/7/5
/// @author:lrs
class DioWebView extends StatefulWidget {
  String lingks;

  DioWebView({Key key, this.lingks}) : super(key: key);

  @override
  _DioWebViewState createState() => _DioWebViewState(this.lingks);
}

class _DioWebViewState extends State<DioWebView> {
  _DioWebViewState(this.lingks);

  String lingks;
  WebViewController controller;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebView"),
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: WebView(
          initialUrl: lingks,
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (url) {
            Navigator.of(context).pop();
          },
          onWebViewCreated: (WebViewController cr) {
            controller = cr;
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return LoadingDialog(
                    loadText: "请稍后...",
                  );
                });
          },
        ),
      ),
    );
  }
}
