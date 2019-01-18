import 'package:flutter/material.dart';
import 'loading.dart';

class CardUnit{
  final int cost;  //花费
  final int rarity;  //稀有
  final int priority; //优先
  final String name; //卡牌名称
  final String imgsrc; //封面
  final String href; //链接
  CardUnit(this.cost,this.rarity,this.priority,this.name,this.imgsrc,this.href);
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '皇室战争卡牌 19年1月',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}