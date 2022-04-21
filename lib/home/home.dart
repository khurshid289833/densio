import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/drawer/navigationDrawer.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/utils/appString.dart';
import 'package:untitled2/utils/homescreenCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:untitled2/widget/homeLatestResult.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:untitled2/widget/pending.dart';

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
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                height: 60,
                color: AppColor.summaryBg,
                child: Row(
                  children: [
                    ElevatedButton(
                      child: Text(
                        AppString.summary,
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: () async {},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                

                  child: Column(
                    children: [
                      Card(
                        shadowColor: AppColor.cardShadow,
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(15, 10, 15, 10),
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
                            CarouselSlider.builder(
                              itemCount: 10,
                              itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                                  Container(
                                    child: homeScreenCard(itemIndex),
                                  ),
                              options: CarouselOptions(
                                height: 300.0,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /* Latest Results List*/

                      Card(
                        shadowColor: AppColor.cardShadow,
                        margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(15, 10, 15, 10),
                              child: Text(
                                "Latest Results",
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
                            Container(
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 10,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      padding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/images/light_green_dot.png',
                                                  height: 40,
                                                ),
                                                Image.asset(
                                                  'assets/images/petrol_pump.png',
                                                  height: 20,
                                                ),
                                              ]),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 5, 10, 5),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Device M -01",
                                                    style: TextStyle(
                                                        color: AppColor
                                                            .cardDivider,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "Id- Abcdegh",
                                                    style: TextStyle(
                                                        color:
                                                        AppColor.cardShadow,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 10),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "739.06 kg/m3",
                                                    style: TextStyle(
                                                        color: AppColor
                                                            .cardDivider,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    "26.75 c",
                                                    style: TextStyle(
                                                        color:
                                                        AppColor.cardShadow,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 10),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTapDown: (TapDownDetails details){
                                              _showPopupMenu(details.globalPosition);
                                            },
                                            child: index.isOdd?pending():Container(
                                             padding: EdgeInsets.fromLTRB(15, 6, 15, 6),
                                              width: 100,

                                              decoration: BoxDecoration(
                                                color: index.isOdd?AppColor.acceptBg:AppColor.rejectBg,
                                                borderRadius: BorderRadius.circular(3),
                                              ),
                                              child: Center(child: Text(index.isOdd?"Accepted":"Rejected",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: index.isOdd?AppColor.approvedColor:AppColor.rejectedColor))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void _showPopupMenu(Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: [
        PopupMenuItem<String>(
            child:Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColor.pendingBg,
              ),
              padding: EdgeInsets.fromLTRB(
                  6, 3, 6, 3),
              child: Row(
                children: <Widget>[
                  Text(
                    "Pending",
                    style: TextStyle(
                        color: AppColor
                            .pendingColor),
                  ),
                ],
              ),
            ), value: 'Pending'),
        PopupMenuItem<String>(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColor.acceptBg,
              ),
              padding: EdgeInsets.fromLTRB(
                  6, 3, 6, 3),
              child: Row(
                children: <Widget>[
                  Text("Accept",
                      style: TextStyle(
                          color: AppColor
                              .approvedColor)),
                ],
              ),
            ), value: 'Accept'),
        PopupMenuItem<String>(
            child:  Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColor.rejectBg,
              ),
              padding: EdgeInsets.fromLTRB(
                  6, 3, 6, 3),
              child: Row(
                children: <Widget>[
                  Text("Reject",
                      style: TextStyle(
                          color: AppColor
                              .rejectedColor)),
                ],
              ),
            ), value: 'Reject'),
      ],
      elevation: 8.0,
    );
  }

}
