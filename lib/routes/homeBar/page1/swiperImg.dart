import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @description 作用:
/// @date: 2021/6/22
/// @author: lrs
class SwiperImg extends StatelessWidget {
  List<String> swiperList = [];

  SwiperImg(this.swiperList);

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context1, int index) {
        return Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.network(
              swiperList[index],
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              },
            ),
          ),
        );
      },
      itemCount: swiperList.length,
      pagination: new SwiperPagination(
          builder: DotSwiperPaginationBuilder(
              color: Colors.grey,
              activeColor: Colors.white,
              size: 8.r,
              activeSize: 8.r)),
      scrollDirection: Axis.horizontal,
      autoplay: true,
      onTap: (index) => print('点击了第$index个'),
    );
  }
}
