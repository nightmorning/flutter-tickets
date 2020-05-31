import 'package:tickets/util/const.dart';
import 'package:flutter/material.dart';

class PersonWeight extends StatefulWidget {
  @override
  PersonWeightState createState() => PersonWeightState();
}

class PersonWeightState extends State<PersonWeight> {
  bool userState = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black45,
              ),
              onPressed: () {
                print("setting");
              }),
          IconButton(
              icon: Icon(
                Icons.message,
                color: Colors.black45,
              ),
              onPressed: () {
                print("bell");
              })
        ],
      ),
      body: _personBody(),
    );
  }

  _personBody() {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(), // 禁止滑动
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(0),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
//        crossAxisSpacing: 8.0,
//        mainAxisSpacing: 8.0,
              childAspectRatio: 1 / 1.9,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: Colors.black12.withAlpha(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _personContent(),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ),
      ],
    );
  }

  _personContent() {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _header(),
            _ticket(),
            _menu1(),
            _menu2(),
          ]),
    );
  }

  _header() {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      height: 100.0,
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
                radius: 32.0,
                backgroundImage: NetworkImage(
                    "https://img2.woyaogexing.com/2020/05/28/63cb3ed82eca47efb7f2dece2e6a2a30!400x400.jpeg")),
        title: Text("飞泉鸣玉",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
        subtitle: Row(
          children: <Widget>[
            Icon(Icons.hotel),
            Icon(Icons.subject),
            Text("3987")
          ]
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
                print("face");
              },
      ),
    );
  }

  _ticket() {
    List<Map<String, dynamic>> _icons = [
      {
        "icon": Icons.ac_unit,
        "title": "待付款",
        "status": 1,
      },
      {
        "icon": Icons.airport_shuttle,
        "title": "待取票",
        "status": 2,
      },
      {
        "icon": Icons.all_inclusive,
        "title": "待观看",
        "status": 3,
      },
      {
        "icon": Icons.beach_access,
        "title": "退票",
        "status": 4,
      },
    ];

    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 10),
      //padding: EdgeInsets.only(left: 10, right: 10),
      color: Colors.white,
      child: Column(children: <Widget>[
        Container(
            decoration: UnderlineTabIndicator(
                borderSide: BorderSide(width: 0.5, color: Colors.black12),
                insets: EdgeInsets.fromLTRB(15, 0, 15, 0)),
            child: ListTile(
                  title: Text("我的票", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                  subtitle: Text("查看更多票务",
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 12)),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: (){
                    Navigator.pushNamed(context, "/my_ticket/all");
                  },
                )),
        Container(
          color: Colors.white,
          child: BottomNavigationBar(
                // 底部导航
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.grey),
                    title: Text('待付款', style: TextStyle(color: Colors.grey)),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.event_busy, color: Colors.grey),
                    title: Text('待取票', style: TextStyle(color: Colors.grey)),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.spa, color: Colors.grey),
                    title: Text('待观看', style: TextStyle(color: Colors.grey)),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person, color: Colors.grey),
                    title: Text('退票', style: TextStyle(color: Colors.grey)),
                  ),
                ],
                elevation: 0,
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                onTap: ((selectedIndex) => (){
                  Navigator.pushNamed(context, OrderRouter[selectedIndex]);
                }),
              )
        )
      ]),
    );
  }

  _menu1() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), // 禁止滑动
        children: ListTile.divideTiles(context: context, tiles: [
          ListTile(
            title: Text('关注演出'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("关注演出");
            },
          ),
          ListTile(
            title: Text('我的买卖'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("我的买卖");
            },
          ),
          ListTile(
            title: Text('收获地址'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("收获地址");
            },
          ),
        ]).toList(),
      ),
    );
  }

  _menu2() {
    return Container(
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), // 禁止滑动
        children: ListTile.divideTiles(context: context, tiles: [
          ListTile(
            title: Text('常用购票人'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("常用购票人");
            },
          ),
          ListTile(
            title: Text('在线客服'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("在线客服");
            },
          ),
          ListTile(
            title: Text('意见反馈'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("意见反馈");
            },
          ),
        ]).toList(),
      ),
    );
  }
}

onItemTapped(int selectedIndex) {
  print("我的票$selectedIndex");
}
