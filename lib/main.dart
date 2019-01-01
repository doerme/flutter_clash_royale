import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

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
      title: '皇室战争卡牌 19年1月',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '皇室战争卡牌 19年1月'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Widget> typeListWidgets(List<String> typeList, Map cards) {
    List<Widget> list = new List();
    for(var i = 0; i < typeList.length; i++){
      list.add(Center(child:RaisedButton(
        child: Text(typeList[i]),
        color: Theme.of(context).accentColor,
        elevation: 4.0,
        splashColor: Colors.blueGrey,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => CardGroupList(groupData: cards['data']['groupData'][i], title: typeList[i])
          ));
        },
      )));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new FutureBuilder(
        future: DefaultAssetBundle
          .of(context)
          .loadString('static/json/card_data.json'),
        builder: (context, snapshot) {
          var jsondata=json.decode(snapshot.data.toString());
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: typeListWidgets(['军队','建筑','法术'], jsondata),
          );
        }
      ),
    );
  }
}

class CardGroupList extends StatelessWidget{
  final Map groupData;
  final String title;
  CardGroupList({Key key, this.groupData, this.title}) : super(key: key);
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: GridView.count(
        padding: EdgeInsets.only(top: 50.0),
        crossAxisCount: 4,
        children: List.generate(groupData['cards'].length, (index) {
          return new ListTile(
            leading: new Image.asset(groupData['cards'][index]['staticsrc']),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => CardDetail(webviewUri: groupData['cards'][index]['href'], cardName: groupData['cards'][index]['name'])
              ));
            },
          );
        }),
      )
    );
  }
}

class CardDetail extends StatelessWidget{
  final String webviewUri;
  final String cardName;
  CardDetail({Key key, this.webviewUri, this.cardName}): super(key: key);

  @override
  Widget build(BuildContext content){
    return WebviewScaffold(
      url: webviewUri,
      appBar: AppBar(title: Text(cardName)),
    );
  }
}