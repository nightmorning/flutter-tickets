import 'package:tickets/util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TicketList extends StatefulWidget {
  final String title;

  TicketList({Key key, this.title});

  @override
  _TicketListState createState() => _TicketListState();
}

class _TicketListState extends State<TicketList>
    with AutomaticKeepAliveClientMixin<TicketList> {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  final Map<int, String> OrderStatus = {
    0: "待付款",
    1: "待取票",
    2: "待观看",
    3: "退票",
  };

  List data = [
    {
      'id': 0,
      'title': '2018 张学友.经典世界巡回演唱会-上饶站河西走廊',
      'image': 'assets/images/book/img6841634d5364c8.jpg',
      'price': 1200.04,
      'original_price': 999.01,
      'view_time': 1590736075,
      'sn': '36728302322',
      'num': 2,
      'status': 1,
      'address': '上海东方明珠体育中心',
      'freight': 10.00,
    },
    {
      'id': 0,
      'title': '2018 张学友.经典世界巡回演唱会-上饶站河西走廊',
      'image': 'assets/images/book/img6841634d5364c8.jpg',
      'price': 1200.04,
      'original_price': 999.01,
      'view_time': 1590736075,
      'sn': '36728302322',
      'num': 2,
      'status': 1,
      'address': '上海东方明珠体育中心',
      'freight': 10.00,
    },
    {
      'id': 0,
      'title': '2018 张学友.经典世界巡回演唱会-上饶站河西走廊',
      'image': 'assets/images/book/img6841634d5364c8.jpg',
      'price': 1200.04,
      'original_price': 999.01,
      'view_time': 1590736075,
      'sn': '36728302322',
      'num': 2,
      'status': 1,
      'address': '上海东方明珠体育中心',
      'freight': 10.00,
    },
    {
      'id': 0,
      'title': '2018 张学友.经典世界巡回演唱会-上饶站河西走廊',
      'image': 'assets/images/book/img6841634d5364c8.jpg',
      'price': 1200.04,
      'original_price': 999.01,
      'view_time': 1590736075,
      'sn': '36728302322',
      'num': 2,
      'status': 1,
      'address': '上海东方明珠体育中心',
      'freight': 10.00,
    },
    {
      'id': 0,
      'title': '2018 张学友.经典世界巡回演唱会-上饶站河西走廊',
      'image': 'assets/images/book/img6841634d5364c8.jpg',
      'price': 1200.04,
      'original_price': 999.01,
      'view_time': 1590736075,
      'sn': '36728302322',
      'num': 2,
      'status': 1,
      'address': '上海东方明珠体育中心',
      'freight': 10.00,
    },
    {
      'id': 0,
      'title': '2018 张学友.经典世界巡回演唱会-上饶站河西走廊',
      'image': 'assets/images/book/img6841634d5364c8.jpg',
      'price': 1200.04,
      'original_price': 999.01,
      'view_time': 1590736075,
      'sn': '36728302322',
      'num': 2,
      'status': 1,
      'address': '上海东方明珠体育中心',
      'freight': 10.00,
    },
  ];

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    data.add((data.length + 1));
    data[data.length - 1] = data[data.length - 2];
    // 超过20显示没有数据了
    if (data.length > 20) {
      _refreshController.loadNoData();
      return;
    }
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("上拉加载");
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("加载失败！点击重试！");
          } else if (mode == LoadStatus.canLoading) {
            body = Text("松手,加载更多!");
          } else {
            body = Text("没有更多数据了!");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView.builder(
        itemBuilder: (c, i) => getList(data[i]),
        itemExtent: 300.0,
        itemCount: data.length,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget getList(Map<String, dynamic> data) {
    var sum = data["num"] * data["price"];
    return new Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10.0, bottom: 10),
            child: Row(children: <Widget>[
              Container(
                width: 340.0,
                child: Text(
                  "票号: " + data["sn"],
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.black45),
                ),
              ),
              Container(
                child: Text(
                  OrderStatus[data["status"]],
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: Colors.red),
                ),
              ),
            ]),
          ),
          Row(
            children: <Widget>[
              Container(
                child: Image.asset(data["image"]),
                width: 120.0,
                height: 140.0,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  width: 190.0,
                  height: 140.0,
                  child: Column(children: <Widget>[
                    Text(
                      data["title"],
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        alignment: Alignment.topLeft,
                        child: Text(data["address"],
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 12))),
                    Container(
                        padding: EdgeInsets.only(top: 50),
                        alignment: Alignment.bottomLeft,
                        child: Text(getTimestamp(data["view_time"]),
                            style: TextStyle(
                                fontWeight: FontWeight.w200, fontSize: 10))),
                  ])),
              Container(
                  alignment: Alignment.topRight,
                  width: 80.0,
                  height: 140.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topRight,
                        child: Text("¥" + data["price"].toString()),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          "¥" + data["original_price"].toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 10,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: const Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.topRight,
                          child: Text("x" + data["num"].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w200, fontSize: 10))),
                    ],
                  ))
            ],
          ),
          Container(
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)))),
              width: 380,
              height: 40,
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <
                  Widget>[
                Text("共" + data["num"].toString() + "张票 合计：¥",
                    style:
                        TextStyle(fontWeight: FontWeight.w200, fontSize: 10)),
                Text(sum.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 12)),
                Text("元(含运费：" + data["freight"].toString() + "元)",
                    style:
                        TextStyle(fontWeight: FontWeight.w200, fontSize: 10)),
              ])),
          Container(
              height: 52,
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    child: OutlineButton(
                        //ButtonTextTheme: ButtonTextTheme.primary,
                        borderSide: BorderSide(color: Colors.red),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Text(
                          "查看物流",
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          print("查看物流");
                        }),
                  ),
                  OutlineButton(
                      textTheme: ButtonTextTheme.accent,
                      color: Colors.white,
                      borderSide: BorderSide(color: Colors.black38),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Text(
                        "退票",
                        style: TextStyle(color: Colors.black38),
                      ),
                      onPressed: () {
                        print("退票");
                      })
                ],
              ))
        ],
      ),
    );
  }
}
