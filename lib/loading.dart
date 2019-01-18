import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'my_home_page.dart';

class SplashScreen extends StatefulWidget {
  final StatefulWidget homePage;
  SplashScreen({Key key, this.homePage}): super(key: key);
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  Map _cardListData;
  Map _cardDetailData;
  void initState() {
    getCardListData();
    getCardDetailData();
    super.initState();
    _controller = AnimationController(
      vsync:this,duration:Duration(milliseconds:3000)
    );
    _animation = Tween(begin: 1.0, end:0.0).animate(_controller);
    /*动画事件监听器，
    它可以监听到动画的执行状态，
    我们这里只监听动画是否结束，
    如果结束则执行页面跳转动作。 */
    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        
      }
    });
    //播放动画
    _controller.forward();
  }

  Future getCardListData() async {
    final response = await http.get('https://www.jeremypay.com/json/clash_royale_card_data.json');
    if (response.statusCode == 200) {
      setState(() {
        _cardListData = json.decode(response.body);
      });
      goMyHomePage();
    } else {
      throw Exception('Failed to load getCardListData');
    }
  }

  Future getCardDetailData() async {
    final response = await http.get('https://www.jeremypay.com/json/card_detail.json');
    if (response.statusCode == 200) {
      setState(() {
        _cardDetailData = json.decode(response.body);
      });
      goMyHomePage();
    } else {
      throw Exception('Failed to load getCardDetailData');
    }
  }

  void goMyHomePage(){
    if(this._cardListData!= null && this._cardDetailData != null){
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
        builder: (context)=> MyHomePage(
          title: '皇室战争卡牌 19年1月',
          cardListData: this._cardListData,
          cardDetailData: this._cardDetailData
        )), 
        (route)=> route==null
      );
    }
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
        child: Image.asset('static/img/loading/doerme.jpg',
        scale: 0.5),
      )
    );
  }
}