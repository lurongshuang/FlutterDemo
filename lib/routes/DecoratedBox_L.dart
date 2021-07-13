import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class DecoratedBox_L extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DecoratedBox_L();
  }
}

// ignore: camel_case_types
class _DecoratedBox_L extends State<DecoratedBox_L> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DecoratedBox_L"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.orange[700]]),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0,
                          spreadRadius: 1.0)
                    ]),
                child: SizedBox(
                  width: 200.r,
                  height: 50.r,
                  child: Center(
                    child: Text("decoration"),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
