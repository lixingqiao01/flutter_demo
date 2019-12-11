import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNotes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddNotesState();
  }

}

class AddNotesState extends State<AddNotes>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _scaffold();
  }

  Widget _scaffold(){
    return Scaffold(
      appBar: AppBar(
        title: Text("添加"),
        centerTitle: true,
      ),
      body: _column(),
    );
  }

  Widget _column(){
    return Column(
      children: <Widget>[
        _topCardSizedBoxCell(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    labelText: "请输入礼金薄名称"
                ),
                controller: TextEditingController.fromValue(TextEditingValue(
                  text: "asdasda"
                )),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "请礼金簿类别"
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "请选择时间"
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "请输入备注信息"
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("提交"),
                  onPressed: (){

                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }




  //卡片
  Widget _topCardSizedBoxCell(){
    return SizedBox(
      height: ScreenUtil.getInstance().setHeight(250),
      child: _topCardCell(),
    );
  }

  Widget _topCardCell(){
    return Card(
      elevation: 15.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(14.0)),
      ),
      child: _topCardCell_Column(),
    );
  }

  Widget _topCardCell_Column(){
    return Column(
      children: <Widget>[
        _topCardCell_Column_Top(),
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

  Widget _topCardCell_Column_Top() {
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

}