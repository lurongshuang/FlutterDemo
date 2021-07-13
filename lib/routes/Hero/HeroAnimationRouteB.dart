import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class HeroAnimationRouteB extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("查看"),
//       ),
//       body: Center(
//         child: Hero(
//           tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
//           child: Padding(
//             padding: EdgeInsets.fromLTRB(20, 200, 20, 0),
//             child: Column(
//               children: [
//                 Image.asset("assets/images/ic_head_def.png"),
//                 Container(
//                   child: isShow
//                       ? Text(
//                           "图片详情图片详情图片详情图片详情图片详情图片详情图片详情图片详情图片详情图片详情图片详情图片详情图片详情图片详情图片详情图片详情")
//                       : null,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class HeroAnimationRouteB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HeroAnimationRouteB();
  }
}

bool isShow = false;

class _HeroAnimationRouteB extends State<HeroAnimationRouteB> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        isShow = true;
      });
    });
  }

  @override
  void deactivate() {
    isShow = false;
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Hero(
            tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
            child: Column(
              children: [
                Container(
                  child: Image.asset(
                    "assets/images/splash_bg.png",
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                if (isShow) Text("图片详情")
              ],
            ),
          )
        ],
      ),
    );
  }
}
