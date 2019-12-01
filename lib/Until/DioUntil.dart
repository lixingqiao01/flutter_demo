import 'package:dio/dio.dart';

class DioUntil {
  final _baseUrl = "http://120.79.128.40:8080/gift";/*基础网址*/
  /*
  * 参数：
  * username:用户手机号
  * password:用户密码
  * Method:POST
  * */
  final _loginUrl = "/api/login";


  //用户登录
  Future login(String username,String password) async {
    return await Dio().post(_baseUrl + _loginUrl,data: {"username":username,"password":password});
  }
}