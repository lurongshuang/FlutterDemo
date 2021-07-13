import 'package:flutter/material.dart';
import 'package:flutter_app_demo/routes/base/BaseStatefulWidget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @description 作用:
/// @date: 2021/7/7
/// @author:lrs
class PullToRefreshRoute extends StatefulWidget {
  PullToRefreshRoute({Key key}) : super(key: key);

  @override
  _PullToRefreshRouteState createState() => _PullToRefreshRouteState();
}

class _PullToRefreshRouteState extends State<PullToRefreshRoute> {
  RefreshController _controller = new RefreshController(initialRefresh: false);
  int itemCount = 15;

  @override
  Widget build(BuildContext context) {
    return BaseStatefulWidget(
      title: "开源刷新加载组件",
      child: RefreshConfiguration(
          footerTriggerDistance: 15,
          dragSpeedRatio: 0.91,
          headerBuilder: () => MaterialClassicHeader(),
          footerBuilder: () => ClassicFooter(),
          enableLoadingWhenNoData: false,
          enableRefreshVibrate: false,
          enableLoadMoreVibrate: false,
          shouldFooterFollowWhenNotFull: (state) {
            // If you want load more with noMoreData state ,may be you should return false
            return false;
          },
          child: Container(
            color: Color.fromRGBO(248, 248, 248, 1),
            child: SmartRefresher(
              header: ClassicHeader(
                  releaseText: '释放刷新',
                  refreshingText: '刷新中...',
                  completeText: '加载成功',
                  idleText: '下拉刷新'),
              footer: ClassicFooter(
                noDataText: '没有更多数据了',
                loadingText: '加载中...',
              ),
              enablePullDown: true,
              enablePullUp: true,
              onLoading: () {
                Future.delayed(Duration(seconds: 1), () {
                  setState(() {
                    itemCount += 10;
                  });
                  if (itemCount > 100) {
                    itemCount = 100;
                    _controller.loadNoData();
                  } else {
                    _controller.loadComplete();
                  }
                });
              },
              onRefresh: () {
                Future.delayed(Duration(seconds: 1), () {
                  setState(() {
                    itemCount = 15;
                  });
                  _controller.refreshCompleted(resetFooterState: true);
                });
              },
              controller: _controller,
              child: ListView.builder(
                  itemCount: itemCount,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(20.r),
                      margin: EdgeInsets.only(bottom: 1),
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {},
                        child: Text("item-$index"),
                      ),
                    );
                  }),
            ),
          )),
    );
  }
}
