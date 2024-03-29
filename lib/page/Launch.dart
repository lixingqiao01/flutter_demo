import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/model/User.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Until/sharedPreferencesUntil.dart';
import 'Login.dart';
import '../Until/DioUntil.dart';
import '../tabBarController.dart';

class Launch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LaunchState();
  }
}

class LaunchState extends State<Launch> {
  WidgetsBinding _widgetsBinding;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ScreenUtil.instance =
    ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
      ..init(context);
    return launchContent(context);
  }

  void navigation(){
    sharedPreferencesUntil().getToken().then((token) {
      print(token);
      if (token == null) {
        runApp(Login());
//        Navigator.pushNamed(context, "/login");
      } else {
        DioUntil().getUserInfo().then((response){
          User().formatJson(response);
          runApp(bottomMenuBarPage());
//        Navigator.pushNamed(context, "/home");
//          Navigator.push(context, MaterialPageRoute(builder: (context) {
//            return bottomMenuBarPage();
//          },fullscreenDialog: true));
        }).catchError((error){
          print(error);
        });
      }
    });
  }

  Widget launchContent(BuildContext context) {
    //判断是否已经登录
    //获取登录验证token


    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: Text("Launch"),
          onPressed: () {
            print("text");
            print(User().name);
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widgetsBinding = WidgetsBinding.instance;
    _widgetsBinding.addPostFrameCallback((callback) {
//      _request();
      //判断页面时候build完成
      navigation();
      print("build完成");
    });
  }
}
