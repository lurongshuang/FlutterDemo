import 'package:flutter/material.dart';

/// 自定义共享数据结构
class DataInheritedWidget extends InheritedWidget {
  DataInheritedWidget({@required this.data, @required Widget child})
      : super(child: child);
  int data = 0;

  static DataInheritedWidget getData(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataInheritedWidget>();
  }

  @override
  bool updateShouldNotify(covariant DataInheritedWidget oldWidget) {
    return oldWidget.data != this.data;
  }
}

/// @description 作用:
/// @date: 2021/6/25
/// @author:lrs
class InheritedWidgetL extends StatefulWidget {
  InheritedWidgetL({Key key}) : super(key: key);

  @override
  _InheritedWidgetLState createState() => _InheritedWidgetLState();
}

class _InheritedWidgetLState extends State<InheritedWidgetL> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget"),
      ),
      //---------------------最外层使用组件------------------------
      body: DataInheritedWidget(
        data: number,
        child: ChildView(),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              number++;
            });
          }),
    );
  }
}

class ChildView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ChildView();
  }
}

class _ChildView extends State<ChildView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Dependencies change  --数据更新");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          //----------显示最上层共享数据-------------
          DataInheritedWidget.getData(context).data.toString(),
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
