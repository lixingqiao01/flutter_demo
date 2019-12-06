
import 'package:flutter_demo/Until/DioUntil.dart';

class HomeBLL {

  factory HomeBLL() => _getInstance();
  static HomeBLL get instance => _getInstance();
  static HomeBLL _instance;
  HomeBLL._internal();

  static HomeBLL _getInstance(){
    if (_instance == null) {
      _instance = new HomeBLL._internal();
    }
    return _instance;
  }

  var items = [];

  Future getItems() async {
    if (items.length == 0) {
      return await _request().then((res){
        return res;
      });
    } else {
      return await items;
    }
  }

  Future _request() async{
    return DioUntil().getNotesList().then((res){
      items = res["response"];
      return items;
    });

  }
}