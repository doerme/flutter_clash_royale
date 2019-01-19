import 'package:flutter/material.dart';
import 'card_list.dart';

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
            builder: (context) => CardList(groupData: cards['data']['groupData'][i], title: typeList[i], cardDetailData:_cardDetailData)
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
        title: Text(this._title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: typeListWidgets(['军队','建筑','法术'], _cardListData),
      ),
    );
  }
}




