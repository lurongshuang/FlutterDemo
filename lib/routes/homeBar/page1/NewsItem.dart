import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class News {
  String name;
  String date;

  News(this.name, this.date);
}

/// @description 作用:
/// @date: 2021/6/22
/// @author: lrs
class NewsItem extends StatelessWidget {
  News newsItem;

  NewsItem(this.newsItem);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      newsItem.name,
                      style: TextStyle(
                        fontSize: 15.r,
                        height: 2.r,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10.r, 0, 10.r),
              child: Container(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    newsItem.date,
                    style: TextStyle(fontSize: 14.r, color: Colors.grey),
                  ),
                ),
              ),
            ),
            Divider(color: Colors.black26, height: 1.r),
          ],
        ),
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("标题"),
                content: Text("内容"+ newsItem.name),
              );
            });
      },
    );
  }
}
