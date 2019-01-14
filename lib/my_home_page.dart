import 'package:flutter/material.dart';
import 'dart:convert';
import 'card_list.dart';

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
            builder: (context) => CardList(groupData: cards['data']['groupData'][i], title: typeList[i])
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



