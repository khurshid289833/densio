import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/drawer/navigationDrawer.dart';
import 'package:untitled2/home/homeDetailsScreen.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/utils/appString.dart';
import 'package:untitled2/utils/homescreenCard.dart';

class Home extends StatefulWidget {
  static const String routeName = '/homePage';

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _key,
        drawer: navigationDrawer(),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  color: Colors.white,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/images/logo.png"),
                      GestureDetector(
                          onTap: () {
                            _key.currentState!.openDrawer();
                          },
                          child: Icon(Icons.sort))
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  height: 60,
                  color: AppColor.summaryBg,
                  child: Row(
                    children: [
                      ElevatedButton(
                        child: Text(
                          AppString.summary,
                        style: TextStyle(color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                            textStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold,)),
                        onPressed: () async {},
                      ),
                    ],
                  ),
              Container(
                padding: EdgeInsets.fromLTRB(10,0,10,0),
                color: Colors.white,
                height: 70,
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Image.asset("assets/images/logo.png")
                  ,
                  GestureDetector(onTap:(){
                    _key.currentState!.openDrawer();
                  },child: Icon(Icons.sort))

                ],),

              ),

              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                height: 60,
                color: AppColor.summaryBg,
                child: Row(

                  children: [ElevatedButton(

                    child: Text(
                      AppString.summary,

                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent ,
                        textStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    onPressed: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeDetailsScreen()));
                    },
                  ),],

                ),
                Card(
                  shadowColor: AppColor.cardShadow,
                  margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Text(
                          "Device Status",
                          style: TextStyle(
                              color: AppColor.cardDivider,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Divider(
                        color: AppColor.greyColor,
                        height: 1,
                      ),
                      homeScreenCard(),

                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
