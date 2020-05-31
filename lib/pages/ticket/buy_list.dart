import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BuyList extends StatefulWidget {
  final String title;

  BuyList({Key key, this.title}) : super(key: key);

  @override
  _BuyListState createState() => _BuyListState();
}

class _BuyListState extends State<BuyList>
    with AutomaticKeepAliveClientMixin<BuyList> {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  List data = [
    {
      'id': 0,
      'title': '2018 张学友.经典世界巡回演唱会-上饶站河西走廊',
      'image': 'assets/images/book/img6841634d5364c8.jpg',
      'play': '99999',
      'comment': '999',
    },
    {
      'id': 0,
      'title': '超级赛亚人',
      'image': 'assets/images/book/img6841634d5364c8.jpg',
      'play': '99999',
      'comment': '999',
    },
    {
      'id': 0,
      'title': '超级赛亚人',
      'image': 'assets/images/book/img6841634d5364c8.jpg',
      'play': '99999',
      'comment': '999',
    },
    {
      'id': 0,
      'title': '超级赛亚人',
      'image': 'assets/images/book/img6841634d5364c8.jpg',
      'play': '99999',
      'comment': '999',
    },
    {
      'id': 0,
      'title': '超级赛亚人',
      'image': 'assets/images/book/img6841634d5364c8.jpg',
      'play': '99999',
      'comment': '999',
    },
    {
      'id': 0,
      'title': '超级赛亚人',
      'image': 'assets/images/book/img6841634d5364c8.jpg',
      'play': '99999',
      'comment': '999',
    }
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
    print(widget.title);
    if (widget.title == "买票") {
      for (int i = 0; i < data.length; i++) {
        data[i]["id"] = i;
        data[i]["title"] = "2028 张杰.经典世界巡回演唱会-上饶站河西走廊";
        data[i]["image"] = 'assets/images/book/img6831634d534970.jpg';
      }
    } else {
      for (int i = 0; i < data.length; i++) {
        data[i]["id"] = i;
        data[i]["title"] = "2018 张学友.经典世界巡回演唱会-上饶站河西走廊";
        data[i]["image"] = 'assets/images/book/img6841634d5364c8.jpg';
      }
    }
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
        itemBuilder: (c, i) => Container(
          child: getList(data[i])
        ),
        itemExtent: 160.0,
        itemCount: data.length,
      ),
    );
  }

  Widget getList(Map<String, dynamic> data) {
    return new Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 10.0, left: 10.0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              data['image'],
              width: 120.0,
              height: 140.0,
            ),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  Container(
                    height: 40.0,
                    child: Text(
                      data["title"],
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20.0, bottom: 5),
                    child: Text("上海卢湾去兰心大剧院",
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 10)),
                  ),
                  Text("2018年10月09日 19:30", style: TextStyle(fontSize: 10)),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "票档：双人",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "¥1100",
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 40.0),
                        child: InkWell(
                          child: Stack(
                            //alignment: Alignment.bottomRight,
                            children: <Widget>[
                              Image.asset(widget.title == "买票"
                                  ? "assets/images/book/buy.png"
                                  : "assets/images/book/sell.png"),
                            ],
                          ),
                          onTap: () {
                            print("2");
                          },
                        ),
                      )
                    ]),
                  )
                ]))
          ]),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
}
