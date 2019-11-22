import 'package:flutter/material.dart';

class FancyFab extends StatefulWidget {

  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  const FancyFab({this.onPressed, this.tooltip, this.icon});

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab> with SingleTickerProviderStateMixin{

  //判断菜单是否已经打开
  bool isOpened = false;

  AnimationController _animationController;
  Animation<Color> _animationColor;
  Animation<double> _animationIcon;

  Animation<double> _translateAddY;
  Animation<double> _translateImageX;
  Animation<double> _translateImageY;

  Curve _curve = Curves.bounceIn;
  double _fabHeight = 56.0;

//  final CurvedAnimation curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 200))..addListener((){
      setState(() {

      });

    });
    _animationIcon = Tween<double>(begin: 0.0,end: 1.0).animate(_animationController);
    _animationColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: _curve,
      ),
    ));

    _translateAddY = Tween<double>(
      begin: 0.0,
      end: -100.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve
      )
    ));
    _translateImageX = Tween<double>(
      begin: 0.0,
      end: -86.6
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve
      )
    ));
    _translateImageY = Tween<double>(
      begin: 0.0,
      end: -50
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve
      )
    ));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  animate(){
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget add() {
    return new Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'Add',
        child: Icon(Icons.person_add),
      ),
    );
  }

  Widget image() {
    return new Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'Image',
        child: Icon(Icons.person_pin),
      ),
    );
  }

  Widget inbox() {
    return new Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'Inbox',
        child: Icon(Icons.playlist_add),
      ),
    );
  }

  Widget toggle(){
    return FloatingActionButton(
      backgroundColor: _animationColor.value,
      onPressed: animate,
      tooltip: 'Toggle',
      child: AnimatedIcon(
        icon: AnimatedIcons.add_event,
        progress: _animationIcon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    print(_translateButton.value * 3);
//    return Column(
//      mainAxisAlignment: MainAxisAlignment.end,
//      children: <Widget>[
//        Transform(
//          transform: Matrix4.translationValues(0.0,_translateButton.value * 3.0, 0.0),
//          child: add(),
//        ),
//        Transform(
//          transform: Matrix4.translationValues(_translateImageY.value,_translateImageX.value * 2, 0.0),
//          child: image(),
//        ),
//        Transform(
//          transform: Matrix4.translationValues(_translateY.value * 1.3, 56, 0.0),
//          child: inbox(),
//        ),
////        add(),
//        toggle(),
//      ],
//    );
      return Stack(
        children: <Widget>[
          Transform(
            transform: Matrix4.translationValues(0.0, _translateAddY.value, 0.0),
            child: add(),
          ),
          Transform(
            transform: Matrix4.translationValues(_translateImageX.value, _translateImageY.value, 0.0),
            child: image(),
          ),
          Transform(
            transform: Matrix4.translationValues(-_translateImageX.value, _translateImageY.value, 0.0),
            child: inbox(),
          ),
          toggle(),
        ],
      );
  }

}