import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @description 作用: 渐变颜色的按钮
/// @date: 2021/6/30
/// @author: lrs
class GradientButton extends StatelessWidget {
  // 渐变色数组
  final List<Color> colors;

  // 按钮宽高
  final double width;
  final double height;

  final Widget child;
  final BorderRadius borderRadius;

  //点击回调
  final GestureTapCallback onPressed;

  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.onPressed,
    this.borderRadius,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    //确保colors数组不空
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: _colors),
          borderRadius: borderRadius),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: Colors.black26,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DefaultTextStyle(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      child: child)),
            ),
          ),
        ),
      ),
    );
  }
}
