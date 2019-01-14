import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'card_list.dart';

import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map _cardListData;
  Map _cardDetailData;
  @override
  void initState () {
    getCardListData();
    getCardDetailData();
    super.initState();
  }

  Future getCardListData() async {
    final response = await http.get('https://www.jeremypay.com/json/clash_royale_card_data.json');
    if (response.statusCode == 200) {
      setState(() {
        _cardListData = json.decode(response.body);
      });
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
    } else {
      throw Exception('Failed to load getCardDetailData');
    }
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
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: typeListWidgets(['军队','建筑','法术'], _cardListData),
      ),
    );
  }
}




