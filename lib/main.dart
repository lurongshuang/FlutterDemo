import 'package:flutter/material.dart';
import 'package:flutter_app_demo/routes/splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(411, 731),
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: Splash(),
        localizationsDelegates: [
          // 本地化的代理类
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en','US'),//美国英文
          const Locale('zh','CN'),//中文简体
        ],
        localeResolutionCallback: (deviceLocale, supportedLocales){
          print('本机语言: $deviceLocale');
          return  deviceLocale;
        },
      ),
    );
  }
}
