import 'package:flutter/material.dart';
import '../Until/DioUntil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../BLL/HomeBLL.dart';
import 'AddNotes.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    print("------------------createState----------------");
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var items = [];
  WidgetsBinding _widgetsBinding;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _scaffold();
  }

  Widget _scaffold(){
    return Scaffold(
      appBar: AppBar(
        title: Text("薄"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.note_add),
            onPressed:  rightNavigatonBarAction,
          )
        ],
      ),
      body: _listView(),
    );
  }

  rightNavigatonBarAction(){
    print("aaaaa");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) {
              return AddNotes();
            },
            fullscreenDialog: true));
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
      height: ScreenUtil().setHeight(250),
      child: _card(index),
    );
  }

  Widget _card(int index) {
    return Card(
        elevation: 15.0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14.0))),
        child: _column(index));
  }

  Widget _column(int index) {
    return Column(
      children: <Widget>[
//        _listTitle(index,"标题"),
        _cellTop(),
        new Divider(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14.0
          ),
          child: Row(
            children: <Widget>[
              Text(
                  "备注：",
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(30),
                  color: Colors.grey
                ),
              ),
              Text(
                  "我是备注消息",
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(30),
                  color: Colors.grey
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _cellTop() {
    return SizedBox(
      width: double.infinity,
      height: ScreenUtil().setHeight(160),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _expanded("合计", "99999999", Colors.grey, Colors.black, 24, 30),
          _expanded("礼薄一", "囍", Colors.black, Colors.red, 40, 80),
          _expanded("时间", "2019-12-06", Colors.grey, Colors.black, 24, 30),
        ],
      ),
    );
  }

  Widget _expanded(String title, String content, Color titleColor,
      Color contentColor, double titleFontSize, double contentFontSize) {
    return Expanded(
      child: Center(
//            widthFactor: ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(titleFontSize),
                  color: titleColor),
            ),
            Text(
              content,
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(contentFontSize),
                  color: contentColor),
            )
          ],
        ),
      ),
      flex: 1,
    );
  }

  Widget _listTitle(int index, String title) {
    return new ListTile(
        title:
            new Text(title, style: new TextStyle(fontWeight: FontWeight.w500)),
//      subtitle: new Text("${index}"),
        leading: new Icon(
          Icons.restaurant_menu,
          color: Colors.blue[500],
        ));
  }

  void _request() {

    HomeBLL().getItems().then((res) {
      print("items == ${res}");
      setState(() {
        items = res;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widgetsBinding = WidgetsBinding.instance;
    _widgetsBinding.addPostFrameCallback((callback) {
      _request();
      ScreenUtil.instance =
          ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
            ..init(context);
    });
  }
}
