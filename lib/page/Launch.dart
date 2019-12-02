import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/main.dart';
import 'package:flutter_demo/model/User.dart';
import '../Until/sharedPreferencesUntil.dart';
import 'Login.dart';
import '../Until/DioUntil.dart';
import '../tabBarController.dart';

class Launch extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LaunchState();
  }
}

class LaunchState extends State<Launch>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Launch",
      home: launchContent(),
    );
  }

  Widget launchContent(){
    //判断是否已经登录
    //获取登录验证token

    sharedPreferencesUntil().getToken().then((token) {
      print(token);
      if (token == null) {
        runApp(Login());
      } else {
        DioUntil().getUserInfo().then((response){
//          Map userMap = json.decode(json.encode(response));
          User().formatJson(response);
          runApp(bottomMenuBarPage());
        }).catchError((error){
          print(error);
        });
      }
    });

    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: Text("Launch"),
          onPressed: (){
            print("text");
            print(User().name);
          },
        ),
      ),
    );
  }

}