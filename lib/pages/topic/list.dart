import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TopicWidget extends StatefulWidget {
  final String title;

  TopicWidget(this.title);

  @override
  TopicWidgetState createState() => TopicWidgetState();
}

class TopicWidgetState extends State<TopicWidget>
    with AutomaticKeepAliveClientMixin<TopicWidget> {
  @override
  // TODO: implement wantKeepAlive 防止页面重绘
  bool get wantKeepAlive => true;

  VideoPlayerController videoPlayerController;
  ChewieController chewieController;

  List data = [
    {
      'id': 0,
      'username': "疾风之刃",
      'face':
          "https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4156830825,3265157570&fm=111&gp=0.jpg",
      'title': '经典世界巡回演唱会',
      'depict': '看完这个,我觉得我脸上的痘痘还能再抢救一下！',
      'images': [
        'https://wx3.sinaimg.cn/orj360/006cT8X9ly1gf5n0yn156j30j60j6dh6.jpg',
        'https://wx4.sinaimg.cn/orj360/c1c328caly1gf5m05npkfj20a00a0744.jpg',
        'https://wx3.sinaimg.cn/orj360/006cT8X9ly1gf5n0yn156j30j60j6dh6.jpg',
      ],
      'video':
          'https://f.video.weibocdn.com/Rs8O9zGtlx07Dz72MWeQ01041202kjRy0E010.mp4?label=mp4_720p&template=1280x720.25.0&trans_finger=1f0da16358befad33323e3a1b7f95fc9&Expires=1590479093&ssig=ZyH1Re3lH6&KID=unistore,video',
      'forward': '99999',
      'comment': '999',
      'like': '123',
      'view': '1324',
    },
    {
      'id': 0,
      'username': "疾风之刃",
      'face':
          "https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4156830825,3265157570&fm=111&gp=0.jpg",
      'title': '经典世界巡回演唱会',
      'depict': '看完这个,我觉得我脸上的痘痘还能再抢救一下！',
      'images': [
        'https://wx3.sinaimg.cn/orj360/006cT8X9ly1gf5n0yn156j30j60j6dh6.jpg',
        'https://wx4.sinaimg.cn/orj360/c1c328caly1gf5m05npkfj20a00a0744.jpg',
        'https://wx3.sinaimg.cn/orj360/006cT8X9ly1gf5n0yn156j30j60j6dh6.jpg',
      ],
      'video': '',
      'forward': '99999',
      'comment': '999',
      'like': '123',
      'view': '1324',
    },
    {
      'id': 0,
      'username': "疾风之刃",
      'face':
          "https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4156830825,3265157570&fm=111&gp=0.jpg",
      'title': '经典世界巡回演唱会',
      'depict': '看完这个,我觉得我脸上的痘痘还能再抢救一下！',
      'images': [
        'https://wx3.sinaimg.cn/orj360/006cT8X9ly1gf5n0yn156j30j60j6dh6.jpg',
        'https://wx4.sinaimg.cn/orj360/c1c328caly1gf5m05npkfj20a00a0744.jpg',
        'https://wx3.sinaimg.cn/orj360/006cT8X9ly1gf5n0yn156j30j60j6dh6.jpg',
      ],
      'video':
          'https://f.video.weibocdn.com/Rs8O9zGtlx07Dz72MWeQ01041202kjRy0E010.mp4?label=mp4_720p&template=1280x720.25.0&trans_finger=1f0da16358befad33323e3a1b7f95fc9&Expires=1590479093&ssig=ZyH1Re3lH6&KID=unistore,video',
      'forward': '99999',
      'comment': '999',
      'like': '123',
      'view': '1324',
    },
    {
      'id': 0,
      'username': "疾风之刃",
      'face':
          "https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4156830825,3265157570&fm=111&gp=0.jpg",
      'title': '经典世界巡回演唱会',
      'depict': '看完这个,我觉得我脸上的痘痘还能再抢救一下！',
      'images': [
        'https://wx3.sinaimg.cn/orj360/006cT8X9ly1gf5n0yn156j30j60j6dh6.jpg',
        'https://wx4.sinaimg.cn/orj360/c1c328caly1gf5m05npkfj20a00a0744.jpg',
        'https://wx3.sinaimg.cn/orj360/006cT8X9ly1gf5n0yn156j30j60j6dh6.jpg',
      ],
      'video':
          'https://f.video.weibocdn.com/Rs8O9zGtlx07Dz72MWeQ01041202kjRy0E010.mp4?label=mp4_720p&template=1280x720.25.0&trans_finger=1f0da16358befad33323e3a1b7f95fc9&Expires=1590479093&ssig=ZyH1Re3lH6&KID=unistore,video',
      'forward': '99999',
      'comment': '999',
      'like': '123',
      'view': '1324',
    },
    {
      'id': 0,
      'username': "疾风之刃",
      'face':
          "https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4156830825,3265157570&fm=111&gp=0.jpg",
      'title': '经典世界巡回演唱会',
      'depict': '看完这个,我觉得我脸上的痘痘还能再抢救一下！',
      'images': [
        'https://wx3.sinaimg.cn/orj360/006cT8X9ly1gf5n0yn156j30j60j6dh6.jpg',
        'https://wx4.sinaimg.cn/orj360/c1c328caly1gf5m05npkfj20a00a0744.jpg',
        'https://wx3.sinaimg.cn/orj360/006cT8X9ly1gf5n0yn156j30j60j6dh6.jpg',
      ],
      'video':
          'https://f.video.weibocdn.com/Rs8O9zGtlx07Dz72MWeQ01041202kjRy0E010.mp4?label=mp4_720p&template=1280x720.25.0&trans_finger=1f0da16358befad33323e3a1b7f95fc9&Expires=1590479093&ssig=ZyH1Re3lH6&KID=unistore,video',
      'forward': '99999',
      'comment': '999',
      'like': '123',
      'view': '1324',
    },
    {
      'id': 0,
      'username': "疾风之刃",
      'face':
          "https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4156830825,3265157570&fm=111&gp=0.jpg",
      'title': '经典世界巡回演唱会',
      'depict': '看完这个,我觉得我脸上的痘痘还能再抢救一下！',
      'images': [
        'https://wx3.sinaimg.cn/orj360/006cT8X9ly1gf5n0yn156j30j60j6dh6.jpg',
        'https://wx4.sinaimg.cn/orj360/c1c328caly1gf5m05npkfj20a00a0744.jpg',
        'https://wx3.sinaimg.cn/orj360/006cT8X9ly1gf5n0yn156j30j60j6dh6.jpg',
      ],
      'video':
          'https://f.video.weibocdn.com/Rs8O9zGtlx07Dz72MWeQ01041202kjRy0E010.mp4?label=mp4_720p&template=1280x720.25.0&trans_finger=1f0da16358befad33323e3a1b7f95fc9&Expires=1590479093&ssig=ZyH1Re3lH6&KID=unistore,video',
      'forward': '99999',
      'comment': '999',
      'like': '123',
      'view': '1324',
    },
    {
      'id': 0,
      'username': "疾风之刃",
      'face':
          "https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4156830825,3265157570&fm=111&gp=0.jpg",
      'title': '经典世界巡回演唱会',
      'depict': '看完这个,我觉得我脸上的痘痘还能再抢救一下！',
      'images': [
        'https://wx3.sinaimg.cn/orj360/006cT8X9ly1gf5n0yn156j30j60j6dh6.jpg',
        'https://wx4.sinaimg.cn/orj360/c1c328caly1gf5m05npkfj20a00a0744.jpg',
        'https://wx3.sinaimg.cn/orj360/006cT8X9ly1gf5n0yn156j30j60j6dh6.jpg',
      ],
      'video':
          'https://f.video.weibocdn.com/Rs8O9zGtlx07Dz72MWeQ01041202kjRy0E010.mp4?label=mp4_720p&template=1280x720.25.0&trans_finger=1f0da16358befad33323e3a1b7f95fc9&Expires=1590479093&ssig=ZyH1Re3lH6&KID=unistore,video',
      'forward': '99999',
      'comment': '999',
      'like': '123',
      'view': '1324',
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
    data[data.length-1] = data[data.length-2];
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
        itemBuilder: (c, i) => topicView(data[i]),
        itemExtent: 400.0,
        itemCount: data.length,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  topicView(Map<String, dynamic> data) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 20.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20.0, left: 10),
                child: CircleAvatar(
                    radius: 24.0, backgroundImage: NetworkImage(data['face'])),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 20.0, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        data['username'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(data['title'],
                          style: TextStyle(
                              fontWeight: FontWeight.w200, fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(data['depict']),
                    ),
                    content(data['video'], data['images']),
                  ],
                )),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: 0),
                    child: Text('浏览量 ' + data["view"],
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 12))),
                Container(
                    padding: EdgeInsets.only(),
                    child: Row(children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.thumb_up,
                            size: 12,
                          ),
                          onPressed: () {
                                print("like");
                              }),
                      Text(data["like"],
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 12))
                    ])),
                Container(
                    padding: EdgeInsets.only(),
                    child: Row(children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.comment,
                            size: 12,
                          ),
                          onPressed: () {
                                print("comment");
                              }),
                      Text(data["comment"],
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 12))
                    ])),
              ],
            ),
          )
        ],
      ),
    );
  }

  content(String video, List<String> images) {
    if (video.length != 0) {
      return Container(
        child: videoPlay(video),
      );
    } else {
      int length = 0;
      if (images.length > 2) {
        length = 3;
      } else {
        length = images != null ? images.length : 0;
      }

      if (length > 0) {
        return Container(
          child: GridView.count(
            crossAxisCount: length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              length,
              (index) => GestureDetector(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Image.network(images[index]),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }

    return Container();
  }

  videoPlay(String video) {
    videoPlayerController = VideoPlayerController.network(video);

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: false,
      looping: true,
    );

    return Container(
      child: Expanded(
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
