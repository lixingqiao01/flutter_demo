# flutter_demo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## flutte资料  

[floatingActionButton动画和TextOverflow踩坑](https://blog.csdn.net/qq_41912380/article/details/97612904)  
[Flutter炫酷动画登陆按钮AnimatedLoginButton](https://blog.csdn.net/baoolong/article/details/86534154)  
[谈一谈Flutter中的共享元素动画Hero](https://juejin.im/post/5bcd72aaf265da0a8e6dbe92)  
[Flutter中文网文档](https://flutterchina.club/docs/)  
[Dart快速入门](http://dart.goodev.org/guides/get-started)    
[flutter BottomAppBar 实现不规则底部导航栏](https://blog.csdn.net/zl18603543572/article/details/94876972)  
[教程：Flutter中的动画](https://flutterchina.club/tutorials/animation/)  
[Flutter数据存储之shared_preferences](https://www.jianshu.com/p/735b5684e900)

## Flutter中的动画  

###资料
Flutter中的动画系统基于Animation对象的，widget可以在build函数中读取Animation对象的当前值， 并且可以监听动画的状态改变。  
### Animation\<double>  
在Flutter中，Animation对象本身和UI渲染没有任何关系。Animation是一个抽象类，它拥有其当前值和状态（完成或停止）。其中一个比较常用的Animation类是Animation<double>。

Flutter中的Animation对象是一个在一段时间内依次生成一个区间之间值的类。Animation对象的输出可以是线性的、曲线的、一个步进函数或者任何其他可以设计的映射。 根据Animation对象的控制方式，动画可以反向运行，甚至可以在中间切换方向。

Animation还可以生成除double之外的其他类型值，如：Animation<Color> 或 Animation<Size>。

Animation对象有状态。可以通过访问其value属性获取动画的当前值。

Animation对象本身和UI渲染没有任何关系。  

### AnimationController  
AnimationController是一个特殊的Animation对象，在屏幕刷新的每一帧，就会生成一个新的值。默认情况下，AnimationController在给定的时间段内会线性的生成从0.0到1.0的数字。 例如，下面代码创建一个Animation对象，但不会启动它

