import 'package:flutter/material.dart';
import 'package:untitled2/home/home.dart';
import 'package:untitled2/drawer/pageRoutes.dart';
import 'package:untitled2/webhooks/webhooks.dart';

class Dashboard extends StatefulWidget{
  static const String routeName = '/dashboard';
  @override
  State<StatefulWidget> createState() {

    return DashboardState();
  }
  
}
class DashboardState extends State<Dashboard>{
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'NavigationDrawer Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      routes:  {
        pageRoutes.home: (context) => Home(),
        pageRoutes.webhook: (context) => Webhooks(),
        pageRoutes.webhook: (context) => Webhooks(),
        pageRoutes.webhook: (context) => Webhooks(),
        pageRoutes.webhook: (context) => Webhooks(),
      },
    );
  }

  
}