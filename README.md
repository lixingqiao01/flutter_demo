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

###Container  
|属性|说明|类型|  
|---|---| --- |  
|key|Container唯一标识符| String |  
|alignment|在容器内对齐[child]<br/>如果非空，则容器将展开以填充其父容器,<br/>并根据给定的值将其子容器定位在自身内。<br/>如果传入的约束是无界的，<br/>则子元素将被收缩包装。如果[child]为空则忽略。| AlignmentGeometry|  
|padding|decoration内部的空白区域,如果有child的话，<br/>child位于padding内部。|EdgeInsetsGeometry|  
|color|用来设置container背景色，<br/>如果foregroundDecoration设置的话，<br/>可能会遮盖color效果。|Color|  
|decoration|绘制在child后面的装饰，设置了decoration的话，<br/>就不能设置color属性，否则会报错，<br/>此时应该在decoration中进行颜色的设置。|Decoration|  
|foregroundDecoration|绘制在child前面的装饰。|Decoration|  
|width|container的宽度，设置为double.infinity可以强制<br/>在宽度上撑满，不设置，则根据child和父节点两<br/>者一起布局。|double|  
|height|container的高度，设置为double.infinity可以强制<br/>在高度上撑满。|double|  
|constraints|添加到child上额外的约束条件。|BoxConstraints|  
|margin|围绕在decoration和child之外的空白区域，不<br/>属于内容区域。|EdgeInsetsGeometry|  
|transform|设置container的变换矩阵。|Matrix4|  
|child|container中的内容widget。|Widget|  

|a|b|c|
|-|-|-|
|a|b|c


