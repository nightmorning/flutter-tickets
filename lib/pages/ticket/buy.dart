import 'package:tickets/pages/ticket/buy_list.dart';
import 'package:flutter/material.dart';

class BuyWidget extends StatefulWidget {
  @override
  BuyWidgetState createState() => BuyWidgetState();
}

class BuyWidgetState extends State<BuyWidget>
    with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    Tab(
      text: "卖票",
    ),
    Tab(
      text: "买票",
    )
  ];

  TabController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          appBar: AppBar(
            title: Text("买卖"),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.black54,
                    size: 32,
                  ),
                  onPressed: () {
                    print("object");
                  }),
            ],
            bottom: TabBar(
                controller: controller,
                tabs: tabs,
                indicatorColor: Colors.black54),
          ),
          body: TabBarView(
            controller: controller,
            children: tabs.map((Tab tab) {
              return Container(
                padding: EdgeInsets.only(top: 20),
                child: BuyList(title: tab.text));
            }).toList(),
          )),
    ));
  }

  @override
    void initState() {
      super.initState();

      controller =
          TabController(initialIndex: 0, length: tabs.length, vsync: this);
    }

  
}
