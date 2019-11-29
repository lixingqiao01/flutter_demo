import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  String _username;
  String _password;
  String _error = null;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: SizedBox(
            height: 300,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Card(
                  elevation: 15.0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Text("title"),
                        TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "请输入电话号码",
                            prefixIcon: Icon(Icons.phone_iphone),
//                        helperText: "aaaaaa"
                          errorText: _error
                          ),
                          onChanged: (text) {
                            print(text);
                            _username = text;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "请输入用户密码",
                            prefixIcon: Icon(Icons.vpn_key),
//                          helperText: "aaaaaa"
                          ),
                          onChanged: (text) {
                            _password = text;
                          },
                          obscureText: true,
                        ),
                        MaterialButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: Text('登录'),
                          onPressed: () {
                            print("点击了登录");
//                            _loginWithDio();
                            setState(() {
                              _error = "用户民错误";
                            });
                          },
                        )
                      ],
                    ),
                  )),
            )),
      ),
      color: Colors.white,
    );
  }

  Future _loginWithDio() async {
    Response response;
    Dio dio = Dio();
    try {
      response = await dio.post("http://120.79.128.40:8080/gift/api/login",
          data: {"username": _username, "password": _password});
      print(response);
    } on DioError catch (e) {
      print(e);
    }
  }
}
