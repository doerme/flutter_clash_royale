import 'package:flutter/material.dart';
import 'card_detail.dart';
import 'dart:convert';

class CardList extends StatelessWidget{
  final Map groupData;
  final String title;
  CardList({Key key, this.groupData, this.title}) : super(key: key);
  
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
                builder: (context) => CardDataWrap(cardKey: groupData['cards'][index]['href'].replaceAll('https://statsroyale.com/zh/card/', ''))
              ));
            },
          );
        }),
      )
    );
  }
}

class CardDataWrap extends StatelessWidget {
  final String cardKey;
  CardDataWrap({Key key, this.cardKey}): super(key: key);
  @override
  Widget build(BuildContext context){
    return FutureBuilder(
        future: DefaultAssetBundle
          .of(context)
          .loadString('static/json/card_detail_data.json'),
        builder: (context, snapshot) {
          var jsondata=json.decode(snapshot.data.toString());
          return CardDetail(dataDetail: jsondata['data'][cardKey]);
        }
      );
  }
}