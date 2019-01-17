import 'package:flutter/material.dart';
import 'card_detail/card_detail.dart';

class CardList extends StatelessWidget{
  final Map groupData;
  final String title;
  final Map cardDetailData;
  CardList({Key key, this.groupData, this.title, this.cardDetailData}) : super(key: key);
  
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
              String cardKey = groupData['cards'][index]['href'].replaceAll('https://statsroyale.com/zh/card/', '');
              print('cardKey:');
              print(cardKey);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => CardDetail(dataDetail: cardDetailData['data'][cardKey], assetUri: groupData['cards'][index]['staticsrc'])
              ));
            },
          );
        }),
      )
    );
  }
}