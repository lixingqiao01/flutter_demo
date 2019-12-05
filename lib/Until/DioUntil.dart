import 'dart:convert';

import 'package:dio/dio.dart';
import '../Until/sharedPreferencesUntil.dart';

class DioUntil {
  final _baseUrl_company = "http://192.168.0.115:8080/gift_war_exploded"; //公司网址
  final _baseUrl_Aliyun = "http://120.79.128.40:8080/gift"; //阿里云地址
  final _baseUrl_home = "http://192.168.2.112:8080/gift_war"; //家中地址
  /*
  * 参数：
  * username:用户手机号
  * password:用户密码
  * Method:POST
  * */
  final _loginUrl = "/api/login";
  final _getUserInfo = "/api/getUserInfo";
  final _getNotesList = "/notes/list";

  Dio _getDio() {
    Dio dio = new Dio();

    //拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      options.path = _baseUrl_home + options.path;
      options.data = json.encode(options.data);
      options.headers = {
        "authorization": sharedPreferencesUntil().token,
      };
      return options;
    }, onResponse: (Response response) {
      var status = response.data["status"];
      if (status == 10003) {
        var token = response.data["token"];
        sharedPreferencesUntil().setToken(token);
      }

      return response;
    }));


    return dio;
  }

  //用户登录
  Future login(String username, String password) async {
    return await _getDio()
        .post(_loginUrl, data: {"username": username, "password": password});
  }

  //获取用户信息
  Future getUserInfo() async {
    return await _getDio().post(_getUserInfo).then((response) {
      return json.decode(json.encode(response.data["response"]));
    });
  }

  Future getNotesList() async {
    return await _getDio().post(_getNotesList).then((res){
      return res.data;
    });
  }
}
