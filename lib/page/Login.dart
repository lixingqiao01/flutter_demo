import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_demo/main.dart';
import 'package:flutter_demo/tabBarController.dart';
import '../Until/DioUntil.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../Until/sharedPreferencesUntil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  FocusNode _focusNode = FocusNode();

  bool _saving = false;
  final snackBar = new SnackBar(content: new Text("snackBar"));

  @override
  void initState() {
    // TODO: implement initState
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        //获取焦点
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: "Login",
      home: _gestureDetector(),
    );
  }

  Widget _gestureDetector(){

    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: _modalProgressHUD()
    );
  }

  Widget _container(){
    return Container(
      child: _loginView(),
      color: Colors.white,
    );
  }

  Widget _scaffold(){
    return Scaffold(
      body: _loginView(),
      backgroundColor: Colors.white,
    );
  }

  Widget _modalProgressHUD(){
    return ModalProgressHUD(
      child: _scaffold(),
      inAsyncCall: _saving,
    );
  }

  Widget _loginView() {
    return Center(
      child: SizedBox(
          height: 400,
          child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Card(
                        elevation: 15.0,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(14.0))),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              Text("title/icon"),
                              TextField(
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  labelText: "请输入电话号码",
                                  prefixIcon: Icon(Icons.phone_iphone),
//                        helperText: "aaaaaa"
//                                      errorText: _error
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
                                ),
                                onChanged: (text) {
                                  _password = text;
                                },
                                obscureText: true,
                              ),
                              Expanded(
                                child: Center(
                                  child: SizedBox(
                                    width: double.infinity,
//                            height: 30,
                                    child: MaterialButton(
                                      color: Colors.blue,
                                      textColor: Colors.white,
                                      child: Text('登录'),
                                      onPressed: () {
                                        print("点击了登录");
                                        setState(() {
                                          _saving = true;
                                        });
                                        FocusScope.of(context).requestFocus(FocusNode());
                                        DioUntil().login(_username, _password).then((response) {
                                          print(response);
//                                              status = response.data["status"];
                                          if (response.data["status"] == 10000) {
                                            print(response.data["response"]);
                                            //登录成功后保存用户token
                                            sharedPreferencesUntil().setToken(response.data["response"]);
                                            sharedPreferencesUntil().token = response.data["response"];
                                            runApp(bottomMenuBarPage());

                                          } else if (response.data["status"] == 10001) {
                                            print("当前用户还未注册");
                                          } else {
                                            print("密码错误");
                                          }
                                        }).whenComplete((){
                                          setState(() {
                                            _saving = false;
                                          });
                                        });
//                                            _loginWithDio().then((response) {
//                                              print(response);
//                                            });
//                                          runApp(MyApp());
                                        setState(() {
                                          _error = "用户名错误";
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        child: Text("前往注册"),
                        textColor: Colors.blue,
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: Text("忘记密码？"),
                        textColor: Colors.blue,
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ))),
    );
  }

  Future _loginWithDio() async {
    Response response;
    Dio dio = Dio();
    try {
      response = await dio.post("http://localhost:8080/gift_war/api/login",
          data: {"username": _username, "password": _password});
      return response;
    } on DioError catch (e) {
      print(e);
    }
  }
}
