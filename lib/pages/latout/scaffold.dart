import 'package:tickets/pages/home/home.dart';
import 'package:tickets/pages/person/person.dart';
import 'package:tickets/pages/ticket/buy.dart';
import 'package:tickets/pages/topic/tab_view.dart';
import 'package:flutter/material.dart';

class ScaffoldWidget extends StatefulWidget {
  @override
  ScaffoldWidgetState createState() => ScaffoldWidgetState();
}

class ScaffoldWidgetState extends State<ScaffoldWidget> {
  int selectedIndex = 0;
  List bottomWidgetList = new List();

  var pages = [
    HomeWidget(),
    BuyWidget(),
    TabViewWidght(),
    PersonWeight(),
  ];
  List tabData = [
    {'text': "首页", 'icon': Icon(Icons.home), 'color': 'grey'},
    {'text': "买卖", 'icon': Icon(Icons.event_busy), 'color': 'grey'},
    {'text': "商圈", 'icon': Icon(Icons.spa), 'color': 'grey'},
    {'text': "我的", 'icon': Icon(Icons.person), 'color': 'grey'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        //导航栏
        title: TextFileWidget(),
        actions: <Widget>[
          CircleAvatar(radius: 32.0,backgroundImage: AssetImage("assets/images/go.jpg"),),
        ],
      ),*/
      body: pages[selectedIndex],
      /*floatingActionButton: FloatingActionButton(
          onPressed: () => onItemTapped(selectedIndex),
          child: Icon(
            Icons. mic_none,
            color: Colors.white,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            title: Text('首页', style: TextStyle(color: Colors.grey)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_busy, color: Colors.grey),
            title: Text('买卖', style: TextStyle(color: Colors.grey)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.spa, color: Colors.grey),
            title: Text('商圈', style: TextStyle(color: Colors.grey)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey),
            title: Text('我的', style: TextStyle(color: Colors.grey)),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(color: Colors.red),
        selectedIconTheme: IconThemeData(color: Colors.red),
        currentIndex: selectedIndex,
        onTap: (selectedIndex) => onItemTapped(selectedIndex),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      print(selectedIndex);
    });
  }

  @override
  void initState() {
    super.initState();
  }
}
