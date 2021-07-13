import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/routes/AnimatedSwitcher/AnimatedSwitcherCounterRoute.dart';
import 'package:flutter_app_demo/routes/Hero/HeroAnimationRoute.dart';
import 'package:flutter_app_demo/routes/HttpClient/future_builder_route_state.dart';
import 'package:flutter_app_demo/routes/HttpClient/http_test_route.dart';
import 'package:flutter_app_demo/routes/Provider/ProviderRoute.dart';
import 'package:flutter_app_demo/routes/PullRefresh/pull_refresh_route.dart';
import 'package:flutter_app_demo/routes/PullToRefresh/pull_to_refresh_route.dart';
import 'package:flutter_app_demo/routes/Route/route_page1.dart';
import 'package:flutter_app_demo/routes/base/BaseStatefulWidget.dart';
import 'package:flutter_app_demo/routes/battery/battery_widget.dart';
import 'package:flutter_app_demo/routes/camera/camera_widget.dart';
import 'package:flutter_app_demo/routes/container_view.dart';
import 'package:flutter_app_demo/routes/custom/GradientButtonRoute.dart';
import 'package:flutter_app_demo/routes/custom/GradientCircularProgressRoute.dart';
import 'package:flutter_app_demo/routes/custom/TurnBoxRoute.dart';
import 'package:flutter_app_demo/routes/custom/q_p_custom_paint_route.dart';
import 'package:flutter_app_demo/routes/files/file_operation_route.dart';
import 'package:flutter_app_demo/routes/files/file_read_wr_test.dart';
import 'package:flutter_app_demo/routes/inherited_widget_l.dart';
import 'package:flutter_app_demo/routes/scroll_controller_l.dart';
import 'package:flutter_app_demo/routes/stagger/StaggerRoute.dart';
import '../AnimatedWidgetsTest.dart';
import '../DecoratedBox_L.dart';
import '../Listener.dart';
import '../ScaleAnimationRoute.dart';
import '../TransFormView.dart';
import '../custom_scroll_view.dart';

class Page3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Page3();
  }
}

var title = 'page3';
PointerEvent _event;

class intent {
  intent(this.title, this.goto);

  String title;
  Widget goto;
}

List<intent> intents = [
  intent("listener组件", Listeners()),
  intent("Decorated组件", DecoratedBox_L()),
  intent("Transform组件", TransFormView()),
  intent("Container组件", ContainerView()),
  intent("CustomScrollView组件_Sliver组件", CustomScrollViewL()),
  intent("ScrollController组件_Scrollbar组件_NotificationListener",
      ScrollControllerL()),
  intent("InheritedWidget 共享数据_组件", InheritedWidgetL()),
  intent("Provider_组件", ProviderRoute()),
  intent("ScaleAnimation", ScaleAnimationRoute()),
  intent("页面跳转切换动画", RoutePage1()),
  intent("Hero动画", HeroAnimationRoute()),
  intent("交织动画", StaggerRoute()),
  intent("动画切换_AnimatedSwitcher", AnimatedSwitcherCounterRoute()),
  intent("过渡动画组件", AnimatedWidgetsTest()),
  intent("自定义渐变按钮", GradientButtonRoute()),
  intent("自定义旋转按钮", TurnBoxRoute()),
  intent("绘制棋盘", QPCustomPaintRoute()),
  intent("绘制自定义圆形进度条", GradientCircularProgressRoute()),
  intent("文件操作", FileOperationRoute()),
  intent("文件操作2", FileReadWrTest()),
  intent("HttpClient请求", HttpTestRoute()),
  intent("dio 请求_FutureBuilder组件_WebView组件", FutureBuilderRouteState()),
  intent("获取电量插件", BatteryWidget()),
  intent("摄像头", CameraWidget()),
  intent("下拉刷新_RefreshIndicator_上拉加载_ListView(ScrollController)",
      PullRefreshRoute()),
  intent("开源下拉刷新_上拉加载_pull_to_refresh: ^2.0.0", PullToRefreshRoute()),
];

class _Page3 extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return BaseStatefulWidget(
        title: '$title',
        child: Center(
          child: ListView.builder(
              itemCount: intents.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(intents[index].title),
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    onTap: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (BuildContext context) {
                        return intents[index].goto;
                      }));
                    });
              }),
        ));
  }
}
