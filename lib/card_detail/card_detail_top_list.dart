import 'package:flutter/material.dart';

class CardDetailTopList extends StatefulWidget {
  final List dataList;
  final List nameList;
  CardDetailTopList({Key key, this.dataList, this.nameList}): super(key: key);
  _CardDetailTopListState createState() => _CardDetailTopListState();
}

class _CardDetailTopListState extends State<CardDetailTopList> {
  List _dataList;
  List _nameList;
  @override
    void initState() {
      this._dataList = super.widget.dataList;
      this._nameList = super.widget.nameList;
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildGridList(),
    );
  }

  Widget buildGridList() {
    List<Widget> tiles = [];//先建一个数组用于存放循环生成的widget
    Widget content; //单独一个widget组件，用于返回需要生成的内容widget
    for(var index = 0; index < this._dataList.length; index++){
      if(this._nameList.length >0 && this._nameList[index] != null){
        tiles.add(
          new Row(children: <Widget>[
            new Text(this._nameList[index])
          ],)
        );
      }
      for(Map item in this._dataList[index]){
        tiles.add(
          new Row(
            children: <Widget>[
              new Text(item['name'])
            ]
          )
        );
      }
    }
    content = new Column(
        children: tiles //重点在这里，因为用编辑器写Column生成的children后面会跟一个<Widget>[]，
        //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
    );
    return content;
  }
}