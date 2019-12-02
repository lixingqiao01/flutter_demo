import 'package:flutter/material.dart';
import 'fancy_fab.dart';
import 'page/home.dart';

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
    return materialApp();
  }

  Widget materialApp(){
    return MaterialApp(
      title: "tabbar",
      home: buildBottomTabScaffold(),
    );
  }

  int currentIndex = 0;

  final pages = [
    ChildItemView("首页"),
    ChildItemView("发现"),
    ChildItemView("动态"),
    ChildItemView("我的")
  ];

  Widget buildBottomTabScaffold() {
    return SizedBox(
      height: 100,
      child: Scaffold(
        body: pages[currentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//        floatingActionButton: FloatingActionButton(
//          child: const Icon(Icons.add),
//          onPressed: (){
//            print("add press");
//          },
//        ),
        floatingActionButton: FancyFab(),

        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 6.0,
          color: Colors.white,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              buildBotomItem(currentIndex, 0, Icons.home, "首页"),
              buildBotomItem(currentIndex, 1, Icons.library_music, "发现"),
              buildBotomItem(currentIndex, -1, null, "发现"),
              buildBotomItem(currentIndex, 2, Icons.email, "消息"),
              buildBotomItem(currentIndex, 3, Icons.person, "我的"),
            ],
          ),
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

  ChildItemView(this._title);

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
      child: Scaffold(
        appBar: new AppBar(
          title: new Text(widget._title),
        ),
        body: Center(
          child: HomePage(),
        ),
      ),
    );
  }
}