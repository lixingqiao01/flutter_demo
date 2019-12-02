import 'package:shared_preferences/shared_preferences.dart';

class sharedPreferencesUntil {

  static final sharedPreferencesUntil _preferencesUntil = sharedPreferencesUntil._internal();
  factory sharedPreferencesUntil(){
    _preferencesUntil.getToken().then((token){
      _preferencesUntil.token = token;
    });
    return _preferencesUntil;
  }
  sharedPreferencesUntil._internal();

  var token;


  static final _TOKEN_KEY = "USER_LOGIN_TOKEN";

  Future _getString(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.getString(key);
  }

  Future _setString(String key,String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(key, value);
  }

  Future getToken(){
    return _getString(_TOKEN_KEY);
  }

  Future setToken(String value){
    return _setString(_TOKEN_KEY, value);
  }

}