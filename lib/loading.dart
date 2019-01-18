import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget homePage;
  SplashScreen({Key key, this.homePage}): super(key: key);
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  void initState() { 
    super.initState();
    _controller = AnimationController(vsync:this,duration:Duration(milliseconds:3000));
    _animation = Tween(begin: 1.0,end:0.0).animate(_controller);
    /*动画事件监听器，
    它可以监听到动画的执行状态，
    我们这里只监听动画是否结束，
    如果结束则执行页面跳转动作。 */
    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context)=> this.widget.homePage), 
          (route)=> route==null);
      }
    });
    //播放动画
    _controller.forward();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FadeTransition( //透明度动画组件
        opacity: _animation,  //执行动画
        child: Image.asset('static/img/loading/efox.jpg',
        scale: 0.5),
      )
    );
  }
}