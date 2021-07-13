import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

/// @description 作用:读写操作
/// @date: 2021/7/1
/// @author:lrs
class FileReadWrTest extends StatefulWidget {
  FileReadWrTest({Key key}) : super(key: key);

  @override
  _FileReadWrTestState createState() => _FileReadWrTestState();
}

TextEditingController _controller;

class _FileReadWrTestState extends State<FileReadWrTest> {
  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController();
    setContext().then((value) => {
          setState(() {
            _controller.text = value;
          })
        });
  }

  Future<String> setContext() async {
    File contextFile = await getFile();
    String text = await contextFile.readAsString();
    return text;
  }

//获取文件
  Future<File> getFile() async {
    var dir = (await getApplicationDocumentsDirectory()).path;
    return new File("$dir/test.txt");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文件操作"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                minLines: 10,
                maxLines: 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Center(
                child: RaisedButton(
                  onPressed: () {
                    savaText();
                  },
                  child: Text("保存"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void savaText() async {
    File save = await getFile();
    save.writeAsString(_controller.text);
    Fluttertoast.showToast(msg: "保存成功");
  }
}
