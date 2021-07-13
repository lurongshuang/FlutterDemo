import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// @description 作用:获取原生电量信息
/// @date: 2021/7/6
/// @author:lrs
class BatteryWidget extends StatefulWidget {
  BatteryWidget({Key key}) : super(key: key);

  @override
  _BatteryWidgetState createState() => _BatteryWidgetState();
}

class _BatteryWidgetState extends State<BatteryWidget> {
  static const platform =
      const MethodChannel('com.example.flutter_app_demo/battery');
  String _batteryLevel = "Unknown battery level.";

  @override
  void setState(fn) {
    super.setState(fn);
  }

  /// 获取电量
  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("获取电量插件"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('当前电量：$_batteryLevel'),
            RaisedButton(
              onPressed: () {
                _getBatteryLevel();
              },
              child: Text("获取电量"),
            )
          ],
        ),
      ),
    );
  }
}
