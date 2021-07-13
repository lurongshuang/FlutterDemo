import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/// @description 作用:
/// @date: 2021/6/22
/// @author: lrs
class PersonnelItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15.r, 15.r, 15.r, 0),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/ic_head_def.png',
                    width: 50.r,
                    height: 50.r,
                    fit: BoxFit.fill,
                  )
                ],
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.r, 0, 0, 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text('王进群'),
                            ),
                            Container(
                                alignment: Alignment(0, 0),
                                padding: EdgeInsets.fromLTRB(5.r, 0.5.r, 5.r, 1.r),
                                decoration: new BoxDecoration(
                                  color: Color.fromRGBO(231, 245, 252, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.0.r)),
                                  border: new Border.all(
                                      width: 1.r,
                                      color: Color.fromRGBO(231, 245, 252, 1)),
                                ),
                                child: Text(
                                  '会员证号：1212',
                                  style: TextStyle(
                                      fontSize: 10.r,
                                      color: Color.fromRGBO(4, 119, 173, 1)),
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.r, 5.r, 0, 0),
                        child: Align(
                          child: Text(
                            '中信置业有限公司',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.r),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.r, 5.r, 0, 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '注册造价师：一级造价师',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12.r),
                              ),
                            ),
                            Text(
                              '管理机构：山西',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.r),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 15.r, 0, 0),
              child: Divider(color: Colors.black26, height: 1.r))
        ],
      ),
    );
  }
}
