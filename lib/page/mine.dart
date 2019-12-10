import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MineStateFulWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MineState();
  }

}

class MineState extends State<MineStateFulWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount:12,
        itemBuilder:(BuildContext context,int index){
        return ListTile(
          title: Text("内容一"),
          leading: Icon(Icons.list),
          trailing: new Icon(Icons.keyboard_arrow_right),
        );
        }
    );
  }

  Widget listTitle(int index) {
    if (index == 0) {
    }
    return null;
  }

}