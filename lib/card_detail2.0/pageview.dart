import 'package:flutter/material.dart';
import '../card_detail/card_detail.dart';

void main() => runApp(MaterialApp(
      home: CardPageView(),
    ));

class CardPageView extends StatefulWidget {
  CardPageView({Key key, this.eqid, this.groupData, this.cardDetailData})
      : super(key: key);
  final int eqid;
  final List groupData;
  final Map cardDetailData;
  @override
  _CardPageViewState createState() => _CardPageViewState();
}

class _CardPageViewState extends State<CardPageView> {
  Map _cardDetailData;
  List _groupData;
  int _eqid;
  @override
  void initState() {
    this._eqid = super.widget.eqid;
    this._groupData = super.widget.groupData;
    this._cardDetailData = super.widget.cardDetailData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: PageController(viewportFraction: 0.8, initialPage: _eqid),
      itemBuilder: (context, position) {
        String _cardKey = super
            .widget
            .groupData[position]['href']
            .replaceAll('https://statsroyale.com/zh/card/', '');
        return Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            child: CardDetail(
                dataDetail: _cardDetailData[_cardKey],
                assetUri: _groupData[position]['staticsrc']));
      },
      itemCount: _groupData.length,
    );
  }
}
