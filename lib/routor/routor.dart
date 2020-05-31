import 'package:tickets/pages/home/home.dart';
import 'package:tickets/pages/latout/scaffold.dart';
import 'package:tickets/pages/ticket/my_ticket.dart';
import 'package:flutter/widgets.dart';


class Router {
  static String router = "/";
  static final Map<String, WidgetBuilder> routers = {
    router: (context) => ScaffoldWidget(),
    "/home": (context) => HomeWidget(),
    "/my_ticket/all": (context) => MyTicket(title: "全部"),
    "/my_ticket/wait/pay": (context) => MyTicket(title: "待付款"),
    "/my_ticket/wait/obtain": (context) => MyTicket(title: "待取票"),
    "/my_ticket/wait/see": (context) => MyTicket(title: "待观看"),
    "/my_ticket/wait/out": (context) => MyTicket(title: "退票"),
  };
}