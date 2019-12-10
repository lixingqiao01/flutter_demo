import 'package:flutter/material.dart';
import 'page/Launch.dart';
import 'Until/sharedPreferencesUntil.dart';

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
    );
  }
}
