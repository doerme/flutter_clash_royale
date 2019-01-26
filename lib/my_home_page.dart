import 'package:flutter/material.dart';
import 'card_list.dart';
import 'dart:ui';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.cardListData, this.cardDetailData, this.appData}) : super(key: key);
  final String title;
  final Map cardListData;
  final Map cardDetailData;
  final Map appData;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map _cardListData;
  Map _cardDetailData;
  String _title;
  @override
  void initState () {
    this._cardListData = super.widget.cardListData;
    this._cardDetailData = super.widget.cardDetailData;
    this._title = '${super.widget.appData['data']['title']} ${super.widget.appData['data']['updatetime']}';
    super.initState();
  }

  Widget buttonStyle(String typename, int index){
    List<Widget> btIcon = [
      Image.asset('static/img/army/barbarians.png'),
      Image.asset('static/img/building/building_elixir_collector.png'),
      Image.asset('static/img/spell/freeze.png'),
    ];
    return  Container(
      width: 120.0,
      child: Row(
        children: <Widget>[
          Container(
            width: 50.0,
            height: 50.0,
            child: btIcon[index],
          ),
          Text(typename)
        ],
      )
    );
    
  }

  

  List<Widget> typeListWidgets(List<String> typeList, Map cards) {
    List<Widget> list = new List();
    for(var i = 0; i < typeList.length; i++){
      list.add(
        Container(
          margin: EdgeInsets.all(10.0),
          child: Center(
            child: RaisedButton(
              child: buttonStyle(typeList[i], i),
              elevation: 4.0,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => CardList(groupData: cards['data']['groupData'][i], title: typeList[i], cardDetailData:_cardDetailData)
                ));
              },
            )
          ),
        )
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Text(this._title),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: Image.asset('static/img/common/timg.jpg')
            ),
            Center(
              child: ClipRect(  //裁切长方形
                child: BackdropFilter(   //背景滤镜器
                  filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0), //图片模糊过滤，横向竖向都设置5.0
                  child: Opacity( //透明控件
                    opacity: 0.5,
                    child: Container(// 容器组件
                      width: 500.0,
                      height: 700.0,
                      decoration: BoxDecoration(color:Colors.grey.shade200), //盒子装饰器，进行装饰，设置颜色为灰色
                      child: Center(
                        child: Text(
                          'Doerme',
                          style: Theme.of(context).textTheme.display3, //设置比较酷炫的字体
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: typeListWidgets(['军队卡牌','建筑卡牌','法术卡牌'], _cardListData),
            ),
          ],
        )
      )
    );
  }
}




