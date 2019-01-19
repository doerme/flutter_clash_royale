import 'package:flutter/material.dart';
import 'card_detail_top_list.dart';
import 'card_detail_bottom_list.dart';

void main() => runApp(MaterialApp(
      home: CardDetail(),
    ));

class CardDetail extends StatefulWidget {
  final Map dataDetail;
  final String assetUri;
  CardDetail({Key key, this.dataDetail, this.assetUri}): super(key: key);

  @override
  _CardDetailState createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  Map cardData;
  String assetUri;
  @override
  void initState() {
    this.cardData = super.widget.dataDetail;
    this.assetUri = super.widget.assetUri;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double _containerPadding = 10.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(cardData['cardname']),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(_containerPadding),
            width: 180.0,
            height: 180.0,
            child: Image.asset(assetUri),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                cardData['cardname'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),
              )
            ],
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(_containerPadding),
              child: Text(
                cardData['description'].replaceAll(cardData['rarity'], ''),
                textAlign: TextAlign.center,
              ),
            )
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(0.0),
              child: Text(
                cardData['rarity'],
                textAlign: TextAlign.center,
              ),
            )
          ),
          Container(
            padding: EdgeInsets.all(_containerPadding),
            child: CardDetailTopList(dataList: cardData['cardUnit'], nameList: cardData['unitName']),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '等级数据',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(_containerPadding),
            child: CardDetailBottomList(dataList: cardData['levelData'], nameList: cardData['unitName'], rare: cardData['rare']),
          ),
        ],
      )
    );
  }
}

