import 'dart:collection';

import 'package:flutter/material.dart';

import 'app_styles.dart';

class Shared {


  static departmentConvert(int code) {
    final Map<int, String> depMap = {
      0:'开发者',
      1:'主席团',
      2:'宣传部',
      3:'活动部',
      4:'设计部',
      5:'行政部',
      6:'公关部',
      7:'学术部',
      8:'赞助部',
      9:'财务部',
      10:'文艺团',

    }; // Is a HashMap

    return depMap[code];
  }

  static databaseConnectionFailedDialog(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 250),
          child: AlertDialog(
              title: Center(child: Text('未能完成登录/注册请求',style: TextStyle(color: Styles.primaryColor, fontWeight: FontWeight.bold, fontSize: 20),)),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text('请检查: '),
                  Text(" - 邮箱与密码是否正确"),
                  Text(" - 网络与VPN设置"),
                  Text(" - 是否存在此用户"),
                ],
              )
          ),
        ));
  }


}