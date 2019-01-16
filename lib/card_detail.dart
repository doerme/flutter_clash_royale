import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: CardDetail(),
    ));

class CardDetail extends StatefulWidget {
  final Map dataDetail;
  CardDetail({Key key, this.dataDetail}): super(key: key);

  @override
  _CardDetailState createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  Map cardData;
  @override
  void initState() {
    this.cardData = super.widget.dataDetail;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(cardData);
    return Scaffold(
      appBar: AppBar(
        title: Text(cardData['cardname']),
      ),
      body: SimpleDialog(
        contentPadding: const EdgeInsets.all(10.0),
        title: new Text(cardData['cardname']),
        children: <Widget>[
          new Text(cardData['description'])
        ],
      )
    );
  }
}