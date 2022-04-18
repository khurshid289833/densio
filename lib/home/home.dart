import 'package:flutter/material.dart';
import 'package:untitled2/drawer/navigationDrawer.dart';

class Home extends StatefulWidget{
  static const String routeName = '/homePage';


  @override
  State<StatefulWidget> createState() {

    return HomeState();
  }
  
}
class HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        drawer: navigationDrawer(),
        body: Center(child: Text("This is home page")));
  }

  
}