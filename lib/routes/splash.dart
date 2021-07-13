import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/routes/Home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Splash();
  }
}

class _Splash extends State<Splash> {
  int number = 5;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        number -= 1;
      });
      if (number == 1) {
        closeTimer();
        intentMain();
      }
    });
  }

  @override
  void dispose() {
    closeTimer();
    super.dispose();
  }

  void closeTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/splash_bg.png',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 40.r, 20.r, 0),
              child: Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: 75.r,
                    height: 30.r,
                    child: FlatButton(
                      onPressed: () {
                        closeTimer();
                        intentMain();
                      },
                      child: Text(
                        '跳过 $number',
                        style: TextStyle(fontSize: 12.r),
                      ),
                      color: Colors.white30,
                      colorBrightness: Brightness.dark,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0.r)),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  void intentMain() {
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(builder: (context) => Home()),
      (route) => false,
    );
  }
}
