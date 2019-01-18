import 'package:flutter/material.dart';

class CardDetailBottomList extends StatefulWidget {
  final List dataList;
  final List nameList;
  CardDetailBottomList({Key key, this.dataList, this.nameList}): super(key: key);
  _CardDetailBottomListState createState() => _CardDetailBottomListState();
}

class _CardDetailBottomListState extends State<CardDetailBottomList> {
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
    List<Widget> tiles = [];
    Widget content;
    for(var index = 0; index < this._dataList.length; index++){
      if(this._nameList.length > index){
        tiles.add(
          Row(children: <Widget>[
            Text(
              this._nameList[index],
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            )
          ],)
        );
      }
      List<Widget> rowWG = [];
      List<Widget> levelCol = [];
      levelCol.add(
        Image.asset('static/img/icons/level.png', height: 20.0, width: 20.0)
      );
      levelCol.add(
        Text('等级')
      );
      for(var level = 6; level <= 13; level++){
        levelCol.add(
          Text('$level')
        );
      }
      rowWG.add(
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: levelCol
          )
      );
      for(var tindex = 0; tindex < this._dataList[index].length; tindex++){
        List<Widget> colsWG = [];
        colsWG.add(
          Image.network('https:${this._dataList[index][tindex]['img']}', height: 20.0, width: 20.0)
        );
        colsWG.add(
          Text(this._dataList[index][tindex]['name'])
        );
        var levelDetail = this._dataList[index][tindex]['detail'];
        Set<String> itemset = Set.from(levelDetail);
        itemset.forEach((element){
          colsWG.add(
            Text(element)
          );
        });
        
        rowWG.add(
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: colsWG
          )
        );
      }
      tiles.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: rowWG
        )
      );
    }
    content = new Column(
        children: tiles //重点在这里，因为用编辑器写Column生成的children后面会跟一个<Widget>[]，
        //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
    );
    return content;
  }
}