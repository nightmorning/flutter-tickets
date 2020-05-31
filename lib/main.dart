import 'package:tickets/pages/latout/scaffold.dart';
import 'package:tickets/routor/routor.dart';
import 'package:flutter/material.dart';


void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Company ERP",
      //home: ScaffoldWidget(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(
            color: Colors.white
          ),
          elevation: 0,
        ),
         primaryColor:Colors.white
      ),
      initialRoute: Router.router,
      routes: Router.routers,
      //onGenerateRoute: ,
    );
  }
}