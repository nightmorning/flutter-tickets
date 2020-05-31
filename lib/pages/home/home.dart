import 'package:tickets/component/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeWidget extends StatefulWidget {
  @override
  HomeWidgetState createState() => HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: TextFileWidget(),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.perm_contact_calendar,
                color: Colors.black45,
              ),
              onPressed: () {
                print("calendar");
              }),
          IconButton(
              icon: Icon(
                Icons.warning,
                color: Colors.black45,
              ),
              onPressed: () {
                print("bell");
              })
        ],
      ),
      body: _customBody(),
    );
  }

  _center() {
    return Container(
      //color: Colors.grey,
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: _swiper(),
            ),
            Container(
              color: Colors.white30,
              child: _homeCate(),
            ),
          ]),
    );
  }

  // 轮播图
  _swiper() {
    var images = [
      "assets/images/book/img6801634d50ebf8.jpg",
      "assets/images/book/img6831634d534970.jpg",
      "assets/images/book/img6841634d5364c8.jpg",
      "assets/images/book/img6851634d538408.jpg",
    ];
    return Container(
        height: 150,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.asset(images[index]);
          },
          itemCount: images.length,
          pagination: new SwiperPagination(),
          //control: new SwiperControl(),
        ));
  }

  // 分类
  _homeCate() {
    List data = [
      {
        'text': "男生",
        'icon': Icon(
          Icons.people,
          size: 20.0,
          color: Colors.white,
        ),
        'name': 'boy'
      },
      {
        'text': "名家",
        'icon': Icon(
          Icons.book,
          size: 20.0,
          color: Colors.white,
        ),
        'name': 'famous'
      },
      {
        'text': "职场",
        'icon': Icon(
          Icons.spa,
          size: 20.0,
          color: Colors.white,
        ),
        'name': 'workplace'
      },
      {
        'text': "神秘",
        'icon': Icon(
          Icons.person,
          size: 20.0,
          color: Colors.white,
        ),
        'name': 'mysterious'
      },
      {
        'text': "特惠",
        'icon': Icon(
          Icons.person,
          size: 20.0,
          color: Colors.white,
        ),
        'name': 'preferential'
      },
      {
        'text': "女生",
        'icon': Icon(
          Icons.person,
          size: 20.0,
          color: Colors.white,
        ),
        'name': 'girl'
      },
      {
        'text': "旅行",
        'icon': Icon(
          Icons.person,
          size: 20.0,
          color: Colors.white,
        ),
        'name': 'travel'
      },
      {
        'text': "科技",
        'icon': Icon(
          Icons.person,
          size: 20.0,
          color: Colors.white,
        ),
        'name': 'technology'
      },
      {
        'text': "日常",
        'icon': Icon(
          Icons.person,
          size: 20.0,
          color: Colors.white,
        ),
        'name': 'daily'
      },
      {
        'text': "伴侣",
        'icon': Icon(
          Icons.person,
          size: 20.0,
          color: Colors.white,
        ),
        'name': 'partner'
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 0),
      physics: new NeverScrollableScrollPhysics(),
      gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
        //SliverGridDelegateWithFixedCrossAxisCount可以直接指定每行（列）显示多少个Item   SliverGridDelegateWithMaxCrossAxisExtent会根据GridView的宽度和你设置的每个的宽度来自动计算没行显示多少个Item
        //横轴的最大长度
        maxCrossAxisExtent: MediaQuery.of(context).size.width / 5.0,
        //主轴间隔
        mainAxisSpacing: 0.0,
        //横轴间隔
        crossAxisSpacing: 0.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
//          color: Colors.orangeAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: IconButton(
                      icon: data[index]['icon'],
                      onPressed: () =>
                          Navigator.pushNamed(context, data[index]['name'])),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 20.0,
                child: Text(
                  data[index]['text'],
                  style: TextStyle(fontSize: 14.0),
                ),
              )
            ],
          ),
        );
      },
      itemCount: data.length,
    );
  }

  // 猜你喜欢
  Widget _guessLike() {
    List data = [
      {
        'id': 0,
        'title': '超级赛亚人',
        'image': 'assets/images/book/img6801634d50ebf8.jpg',
        'play': '99999',
        'comment': '999',
      },
      {
        'id': 0,
        'title': '超级赛亚人',
        'image': 'assets/images/book/img6801634d50ebf8.jpg',
        'play': '99999',
        'comment': '999',
      },
      {
        'id': 0,
        'title': '超级赛亚人',
        'image': 'assets/images/book/img6801634d50ebf8.jpg',
        'play': '99999',
        'comment': '999',
      },
      {
        'id': 0,
        'title': '超级赛亚人',
        'image': 'assets/images/book/img6801634d50ebf8.jpg',
        'play': '99999',
        'comment': '999',
      },
      {
        'id': 0,
        'title': '超级赛亚人',
        'image': 'assets/images/book/img6801634d50ebf8.jpg',
        'play': '99999',
        'comment': '999',
      },
      {
        'id': 0,
        'title': '超级赛亚人',
        'image': 'assets/images/book/img6801634d50ebf8.jpg',
        'play': '99999',
        'comment': '999',
      }
    ];

    return Container(
        color: Colors.white24,
        padding: EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text("猜你喜欢",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
            ),
            SingleChildScrollView(
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, //每行三列
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 0.54 //显示区域宽高相等
                        ),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white10),
                          ),
                          //color: Colors.white10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Image.asset(data[index]["image"]),
                              Container(
                                padding: EdgeInsets.all(6.0),
                                child: Text(data[index]["title"]),
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 20.0,
                                    width: 80.0,
                                    padding: EdgeInsets.only(left: 6.0),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                      "¥299",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                    "起",
                                    style: TextStyle(
                                        color: Colors.black38, fontSize: 12.0),
                                  ),
                                      ],
                                    ),
                                  ),
                                  
                                  Container(
                                      height: 20.0,
                                      width: 40.0,
                                      //color: Colors.black38,
                                      alignment: Alignment.topRight,
                                      //padding: EdgeInsets.only(right: 2.0),
                                      child: Text("预票中",
                                          style: TextStyle(
                                              color: Colors.black38,
                                              fontSize: 12.0))),
                                ],
                              )
                            ],
                          )
                        );
                    }))
          ],
        ));
  }

  _customBody() {
    return CustomScrollView(
      slivers: <Widget>[
        _sliver(),
        new SliverFixedExtentList(
            itemExtent: 600.0,
            delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建列表项      
                  return _guessLike();
                },
                childCount: 1 //50个列表项
            ),
          ),
      ],
    );
  }

  _sliver() {
    return SliverPadding(
      padding: EdgeInsets.all(0),
      sliver: _sliverGrid(),
    );
  }

  _sliverGrid() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
      //  crossAxisSpacing: 8.0,
      //  mainAxisSpacing: 8.0,
        childAspectRatio: 1 / 0.8,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return _mainContainer();
        },
        childCount: 1,
      ),
    );
  }

  _mainContainer() {
    return Container(
      color: Colors.black12.withAlpha(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _center(),
        ],
      ),
    );
  }
}
