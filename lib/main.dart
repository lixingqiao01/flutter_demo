import 'package:flutter/material.dart';
import 'package:flutter_demo/page/home.dart';
import 'package:flutter_demo/tabBarController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'page/Route.dart';
import 'fancy_fab.dart';
import 'page/Login.dart';
import 'page/Launch.dart';
import 'Until/sharedPreferencesUntil.dart';
import 'package:flutter/rendering.dart';

//void main() => runApp(MyApp());

void main() {
  sharedPreferencesUntil();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Launch(),
      initialRoute: "/",
      routes: <String,WidgetBuilder>{
        "/login":(BuildContext context) => new Login(),
        "/home":(BuildContext context) => new bottomMenuBarPage()
      },
    );
  }
}
