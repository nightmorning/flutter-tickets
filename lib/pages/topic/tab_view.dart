import 'package:chewie/chewie.dart';
import 'package:tickets/pages/topic/list.dart';
import 'package:flutter/material.dart';

class TabViewWidght extends StatefulWidget {

  @override
  TabViewWeightState createState() => TabViewWeightState();
}

class TabViewWeightState extends State<TabViewWidght>
    with SingleTickerProviderStateMixin {
  TabController controller;

  final List<Tab> tabs = <Tab>[
    Tab(
      text: "全部",
    ),
    Tab(
      text: "关注",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black54,
                  size: 32,
                ),
                onPressed: () {
                  print("search");
                }),
            title: TabBar(
                controller: controller,
                labelStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                unselectedLabelStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                tabs: tabs,
                labelPadding: EdgeInsets.all(0),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.red),
          ),
          body: TabBarView(
            controller: controller,
            children: tabs.map((Tab tab) {
            return Container(color: Colors.grey, child: TopicWidget(tab.text));
          }).toList(),
          )
    )
    ));
  }

  @override
  void initState() {
    super.initState();

    controller =
        TabController(initialIndex: 0, length: tabs.length, vsync: this);
  }
}
