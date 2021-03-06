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
  intent("listener??????", Listeners()),
  intent("Decorated??????", DecoratedBox_L()),
  intent("Transform??????", TransFormView()),
  intent("Container??????", ContainerView()),
  intent("CustomScrollView??????_Sliver??????", CustomScrollViewL()),
  intent("ScrollController??????_Scrollbar??????_NotificationListener",
      ScrollControllerL()),
  intent("InheritedWidget ????????????_??????", InheritedWidgetL()),
  intent("Provider_??????", ProviderRoute()),
  intent("ScaleAnimation", ScaleAnimationRoute()),
  intent("????????????????????????", RoutePage1()),
  intent("Hero??????", HeroAnimationRoute()),
  intent("????????????", StaggerRoute()),
  intent("????????????_AnimatedSwitcher", AnimatedSwitcherCounterRoute()),
  intent("??????????????????", AnimatedWidgetsTest()),
  intent("?????????????????????", GradientButtonRoute()),
  intent("?????????????????????", TurnBoxRoute()),
  intent("????????????", QPCustomPaintRoute()),
  intent("??????????????????????????????", GradientCircularProgressRoute()),
  intent("????????????", FileOperationRoute()),
  intent("????????????2", FileReadWrTest()),
  intent("HttpClient??????", HttpTestRoute()),
  intent("dio ??????_FutureBuilder??????_WebView??????", FutureBuilderRouteState()),
  intent("??????????????????", BatteryWidget()),
  intent("?????????", CameraWidget()),
  intent("????????????_RefreshIndicator_????????????_ListView(ScrollController)",
      PullRefreshRoute()),
  intent("??????????????????_????????????_pull_to_refresh: ^2.0.0", PullToRefreshRoute()),
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
