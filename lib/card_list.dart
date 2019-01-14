import 'package:flutter/material.dart';
import 'card_detail.dart';

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
                builder: (context) => CardDetail()
              ));
            },
          );
        }),
      )
    );
  }
}