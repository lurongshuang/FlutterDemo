import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'gradient_button.dart';

class GradientButtonRoute extends StatefulWidget {
  @override
  _GradientButtonRouteState createState() => _GradientButtonRouteState();
}

class _GradientButtonRouteState extends State<GradientButtonRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("渐变按钮"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            GradientButton(
              colors: [Colors.teal, Colors.red],
              height: 50.0,
              width: 300.0,
              child: Text("Submit"),
              onPressed: onTap,
            ),
            GradientButton(
              height: 200.0,
              width: 200.0,
              colors: [Colors.amber, Colors.green[700]],
              child: Image.asset(
                "assets/images/ic_head_def.png",
                width: 50,
                height: 50,
              ),
              onPressed: onTap,
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            GradientButton(
              height: 50.0,
              colors: [
                Colors.pinkAccent,
                Colors.blueAccent,
                Colors.teal,
                Colors.deepOrange
              ],
              child: Text("Submit"),
              onPressed: onTap,
            ),
            GradientButton(
              height: 200.0,
              width: 200.0,
              colors: [Colors.amber, Colors.amber],
              child: GradientButton(
                height: 150.0,
                width: 150.0,
                colors: [Colors.green[700], Colors.green[700]],
                child: GradientButton(
                  height: 100.0,
                  width: 100.0,
                  colors: [Colors.amber, Colors.green[700]],
                  child: Text("1"),
                  onPressed: onTap,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                onPressed: onTap,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              onPressed: onTap,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ],
        ),
      ),
    );
  }

  onTap() {
    print("button click");
  }
}
