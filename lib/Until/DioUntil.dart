import 'dart:convert';

import 'package:dio/dio.dart';
import '../Until/sharedPreferencesUntil.dart';

class DioUntil {
  final _baseUrl_company = "http://localhost:8080/gift_war_exploded";//公司网址
  final _baseUrl_Aliyun = "http://120.79.128.40:8080/gift";//阿里云地址
  /*
  * 参数：
  * username:用户手机号
  * password:用户密码
  * Method:POST
  * */
  final _loginUrl = "/api/login";
  final _getUserInfo = "/api/getUserInfo";

  Dio _getDio(){
    Dio dio = new Dio();

    //拦截器
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
       options.headers = {
         "authorization":sharedPreferencesUntil().token,
       };
       return options;
      },
      onResponse: (Response response) {
        var status = response.data["status"];
        if(status == 10003) {
          var token = response.data["token"];
          sharedPreferencesUntil().setToken(token);
        }

        return response;
      }
    ));
    return dio;
  }

  //用户登录
  Future login(String username,String password) async {
    return await _getDio().post(_baseUrl_company + _loginUrl,data: {"username":username,"password":password});
  }

  //获取用户信息
  Future getUserInfo() async {
    return await _getDio().post(_baseUrl_company + _getUserInfo).then((response){

//      return response.data["response"];
    return json.decode(json.encode(response.data["response"]));
    });
  }
}