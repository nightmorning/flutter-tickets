import 'package:flutter/material.dart';

///搜索控件widget
class TextFileWidget extends StatelessWidget {
  Widget buildTextField() {
    //theme设置局部主题
    return TextField(
      cursorColor: Colors.black12, //设置光标
      decoration: InputDecoration(
          contentPadding: new EdgeInsets.only(left: 0.0, bottom: 12.0),
          border: InputBorder.none,
          icon: Icon(Icons.search, color: Colors.black26,),
          hintText: "搜索",
          hintStyle: new TextStyle(fontSize: 14, color: Colors.black26)),
      style: new TextStyle(fontSize: 14, color: Colors.black12),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget editView() {
      return Container(
        //修饰黑色背景与圆角
        decoration: new BoxDecoration(
          //border: Border.all(color: Colors.grey, width: 1.0), //灰色的一层边框
          color: Colors.black12,
          borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
        ),
        alignment: Alignment.center,
        height: 32,
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
        child: buildTextField(),
      );
    }

    return
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: editView(),
          flex: 1,
        ),
      ],
    );
  }
}