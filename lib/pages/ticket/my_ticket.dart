import 'package:tickets/pages/ticket/ticket_list.dart';
import 'package:tickets/util/const.dart';
import 'package:flutter/material.dart';

class MyTicket extends StatefulWidget {
  final String title;

  MyTicket({Key key, this.title});

  @override
  _MyTicketState createState() => _MyTicketState();
}

class _MyTicketState extends State<MyTicket> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Tab> tabs = <Tab>[
      Tab(
        text: "全部",
      ),
      Tab(
        text: "待付款",
      ),
      Tab(
        text: "待取票",
      ),
      Tab(
        text: "待观看",
      ),
      Tab(
        text: "退票",
      )
    ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          appBar: AppBar(
            title: Text("我的票"),
            bottom: TabBar(
                controller: _tabController,
                tabs: tabs,
                indicatorColor: Colors.red),
          ),
          body: TabBarView(
            controller: _tabController,
            children: tabs.map((Tab tab) {
              return Container(child: TicketList(title: tab.text));
            }).toList(),
          )),
    ));
  }

  @override
    void initState() {
      super.initState();

      var index = widget.title != null ? OrderTab[widget.title] : 0;
      _tabController =
          TabController(initialIndex: index, length: tabs.length, vsync: this);
    }

    
}

  