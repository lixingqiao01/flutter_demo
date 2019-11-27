import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }

}

class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
//        itemExtent: 210.0,
        itemBuilder: (BuildContext context, int index) {
          return new SizedBox(
            height: 210,
            child: new Card(
              elevation: 15.0,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
              child: new Column(
                children: <Widget>[
                  new ListTile(
                    title: new Text('标题',style: new TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: new Text('子标题'),
                    leading: new Icon(
                      Icons.restaurant_menu,
                      color: Colors.blue[500],
                    ),
                  ),
                  new Divider(),
                  new ListTile(
                    title: new Text('内容一',
                        style: new TextStyle(fontWeight: FontWeight.w500)),
                    leading: new Icon(
                      Icons.contact_phone,
                      color: Colors.blue[500],
                    ),
                  ),
                  new ListTile(
                    title: new Text('内容二'),
                    leading: new Icon(
                      Icons.contact_mail,
                      color: Colors.blue[500],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

}