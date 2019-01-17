import 'package:flutter/material.dart';
import 'card_detail_top_list.dart';

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
    print(cardData);
    return Scaffold(
      appBar: AppBar(
        title: Text(cardData['cardname']),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10.0),
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
            child: Text(
              cardData['description'],
              textAlign: TextAlign.center,
            ),
          ),
          CardDetailTopList(dataList: cardData['cardUnit'], nameList: cardData['unitName']),
        ],
      )
    );
  }
}

