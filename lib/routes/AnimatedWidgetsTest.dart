import 'package:flutter/material.dart';

class AnimatedWidgetsTest extends StatefulWidget {
  @override
  _AnimatedWidgetsTestState createState() => _AnimatedWidgetsTestState();
}

class _AnimatedWidgetsTestState extends State<AnimatedWidgetsTest> {
  double _padding = 10;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    var duration = Duration(seconds: 1);
    return Scaffold(
      appBar: AppBar(
        title: Text("动画过渡"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  if (_padding == 10) {
                    _padding = 20;
                  } else {
                    _padding = 10;
                  }
                });
              },
              child: AnimatedPadding(
                duration: duration,
                padding: EdgeInsets.all(_padding),
                child: Text("AnimatedPadding"),
              ),
            ),
            SizedBox(
              height: 50,
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    duration: duration,
                    left: _left,
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          if (_left == 0) {
                            _left = 100;
                          } else {
                            _left = 0;
                          }
                        });
                      },
                      child: Text("AnimatedPositioned"),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 100,
              color: Colors.grey,
              child: AnimatedAlign(
                duration: duration,
                alignment: _align,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      if (_align == Alignment.center) {
                        _align = Alignment.topRight;
                      } else {
                        _align = Alignment.center;
                      }
                    });
                  },
                  child: Text("AnimatedAlign"),
                ),
              ),
            ),
            AnimatedContainer(
              duration: duration,
              height: _height,
              color: _color,
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    if (_height == 100) {
                      _height = 150;
                    } else {
                      _height = 100;
                    }
                    if (_color == Colors.blue) {
                      _color = Colors.red;
                    } else {
                      _color = Colors.blue;
                    }
                  });
                },
                child: Text(
                  "AnimatedContainer",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            AnimatedDefaultTextStyle(
              child: GestureDetector(
                child: Text("hello world"),
                onTap: () {
                  setState(() {
                    if (_style == TextStyle(color: Colors.black)) {
                      _style = TextStyle(
                        color: Colors.blue,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: Colors.blue,
                      );
                    } else {
                      _style = TextStyle(color: Colors.black);
                    }
                  });
                },
              ),
              style: _style,
              duration: duration,
            ),
            AnimatedDecoratedBox(
              duration: duration,
              decoration: BoxDecoration(color: _decorationColor),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    if (_decorationColor == Colors.blue) {
                      _decorationColor = Colors.red;
                    } else {
                      _decorationColor = Colors.blue;
                    }
                  });
                },
                child: Text(
                  "AnimatedDecoratedBox",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ].map((e) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: e,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  AnimatedDecoratedBox({
    Key key,
    @required this.decoration,
    this.child,
    Curve curve = Curves.linear, //动画曲线
    @required Duration duration, // 正向动画执行时长
    Duration reverseDuration, // 反向动画执行时长
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
        );
  final BoxDecoration decoration;
  final Widget child;

  @override
  _AnimatedDecoratedBoxState createState() {
    return _AnimatedDecoratedBoxState();
  }
}

class _AnimatedDecoratedBoxState
    extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {
  DecorationTween _decoration; //定义一个Tween

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decoration.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    // 在需要更新Tween时，基类会调用此方法
    _decoration = visitor(_decoration, widget.decoration,
        (value) => DecorationTween(begin: value));
  }
}
