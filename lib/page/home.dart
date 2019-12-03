import 'package:flutter/material.dart';
import '../Until/DioUntil.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final int _count = 10;
  var items = [];
  WidgetsBinding _widgetsBinding;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _listView();
  }

  Widget _listView() {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return _sizedBox(index);
        });
  }

  Widget _sizedBox(int index) {
    return SizedBox(
//      height: 210,
      child: _card(index),
    );
  }

  Widget _card(int index){
    return Card(
      elevation: 15.0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14.0))),
      child: _column(index)
    );
  }

  Widget _column(int index){
    return Column(
      children: <Widget>[
//        _listTitle(index,"标题"),
        _cellTop(),
        new Divider(),
        _listTitle(index, "内容一"),
      ],
    );
  }

  Widget _cellTop(){
    return SizedBox(
      width: double.infinity,
//      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

          Expanded(
            child: Center(
//            widthFactor: ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("合计"),
                  Text("99999")
                ],
              ),
            ),
            flex: 1,
          ),


          Expanded(
            child: Center(
//            widthFactor: ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      "礼薄一",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                    ),
                  ),
                  Text(
                    "囍",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 35
                    ),
                  )
                ],
              ),
            ),
            flex: 1,
          ),


          Expanded(
            child: Center(
//            widthFactor: ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("合计"),
                  Text("2019年12月03日")
                ],
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget _listTitle(int index, String title){
    return new ListTile(
      title: new Text(title,
          style: new TextStyle(fontWeight: FontWeight.w500)),
//      subtitle: new Text("${index}"),
      leading: new Icon(
        Icons.restaurant_menu,
        color: Colors.blue[500],
      )
    );
  }

  void _request(){
    DioUntil().getNotesList().then((res){
      print(res);
      setState(() {
        items = res["response"];
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widgetsBinding = WidgetsBinding.instance;
    _widgetsBinding.addPostFrameCallback((callback){
      _request();
    });
  }
}
