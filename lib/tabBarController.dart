import 'package:flutter/material.dart';
import 'fancy_fab.dart';
import 'page/home.dart';
import 'page/mine.dart';

class bottomMenuBarPage extends StatefulWidget {
  bottomMenuBarPage();

  @override
  bottomMenuBarPageState createState() => bottomMenuBarPageState();

}

class bottomMenuBarPageState extends State<bottomMenuBarPage> {
  bottomMenuBarPageState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return materialApp();
    return materialApp();
  }

  Widget materialApp(){
    return MaterialApp(
      title: "bottomMenuBarPageState_tabbar",
      home: buildBottomTabScaffold(),
    );
  }

  int currentIndex = 0;

  final pages = [
    ChildItemView("首页",HomePage()),
//    HomePage,
    ChildItemView("发现",HomePage()),
    ChildItemView("动态",HomePage()),
    ChildItemView("我的",MineStateFulWidget())
  ];

  Widget buildBottomTabScaffold() {
    return _scaffold();
  }

  Widget _sizedBox(){
    return SizedBox(
      height: 200,
      child: _scaffold(),
    );
  }

  Widget _body_scaffold(){
    return Scaffold(
      body: Text("aaaaa"),
    );
  }

  Widget _scaffold(){
    return Scaffold(
      body: pages[currentIndex],
//      body: _body_scaffold(),
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//      floatingActionButton: FancyFab(),

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            buildBotomItem(currentIndex, 0, Icons.home, "薄"),
            buildBotomItem(currentIndex, 1, Icons.library_music, "发现"),
//            buildBotomItem(currentIndex, -1, null, "发现"),
            buildBotomItem(currentIndex, 2, Icons.email, "消息"),
            buildBotomItem(currentIndex, 3, Icons.person, "我的"),
          ],
        ),
      ),
    );
  }

  buildBotomItem(int selectIndex, int index, IconData iconData, String title) {
    //未选中状态的样式
    TextStyle textStyle = TextStyle(fontSize: 12.0,color: Colors.grey);
    MaterialColor iconColor = Colors.grey;
    double iconSize=20;
    EdgeInsetsGeometry padding =  EdgeInsets.only(top: 8.0);

    if(selectIndex==index){
      //选中状态的文字样式
      textStyle = TextStyle(fontSize: 12.0,color: Colors.blue);
      //选中状态的按钮样式
      iconColor = Colors.blue;
      iconSize=20;
      padding =  EdgeInsets.only(top: 8.0);
    }
    Widget padItem = SizedBox();
    if (iconData != null) {
      padItem = Padding(
        padding: padding,
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: <Widget>[
                Icon(
                  iconData,
                  color: iconColor,
                  size: iconSize,
                ),
                Text(
                  title,
                  style: textStyle,
                )
              ],
            ),
          ),
        ),
      );
    }
    Widget item = Expanded(
      flex: 1,
      child: new GestureDetector(
        onTap: () {
          if (index != currentIndex) {
            setState(() {
              currentIndex = index;
            });
          }
        },
        child: SizedBox(
          height: 52,
          child: padItem,
        ),
      ),
    );
    return item;
  }
}

class ChildItemView extends StatefulWidget {
  String _title;
  Widget _body;

//  ChildItemView(this._title);
  ChildItemView(this._title,this._body);

  @override
  _ChildItemViewState createState() => _ChildItemViewState();
}

//Container(
//      child: Center(child: Text(widget._title)),
//    );
class _ChildItemViewState extends State<ChildItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget._body,
    );
  }
}