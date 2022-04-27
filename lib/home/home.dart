import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/drawer/navigationDrawer.dart';
import 'package:untitled2/model/AllDevicesResponse.dart';
import 'package:untitled2/model/LatestResultResponse.dart';
import 'package:untitled2/services/HomeService.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/utils/appString.dart';
import 'package:untitled2/utils/homescreenCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:untitled2/widget/homeLatestResult.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:untitled2/widget/pending.dart';

import '../widget/loader.dart';

class Home extends StatefulWidget {
  static const String routeName = '/homePage';

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

HomeService _homeService = HomeService();

class HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late AllDevicesResponse? futureDevices;
  late LatestResultResponse? latestResults;
  bool isLoading = true;
  bool isUpdateReadingLoading = false;

  @override
  void initState() {
    getLatestResults();

    super.initState();
  }

  getLatestResults() async {
    latestResults = await _homeService.latestResult(context);
    futureDevices = await _homeService.allDevices(context);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        new Scaffold(
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
                            child: Image.asset(
                              "assets/images/burger_icon.png",
                              height: 25,
                            ))
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
                  isLoading
                      ? Center(
                          child: const CircularProgressIndicator(
                          color: AppColor.primarySwatchColor,
                        ))
                      : Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Card(
                                  shadowColor: AppColor.cardShadow,
                                  margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 10, 15, 10),
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
                                      futureDevices?.data !=null ? CarouselSlider.builder(
                                        itemCount: futureDevices!.data!.length,
                                        itemBuilder: (BuildContext context,
                                                int itemIndex,
                                                int pageViewIndex) =>
                                            Container(
                                          child: homeScreenCard(
                                              itemIndex,
                                              context,
                                              futureDevices!.data![itemIndex]),
                                        ),
                                        options: CarouselOptions(
                                          height: 300.0,
                                        ),
                                      ):Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 10, 15, 10),
                                        child: Text(
                                          "No Data Found",
                                          style: TextStyle(
                                              color: AppColor.cardDivider,
                                              fontSize: 15),
                                        ),
                                      ) ,
                                    ],
                                  ),
                                ),

                                /* Latest Results List*/

                                Card(
                                  shadowColor: AppColor.cardShadow,
                                  margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 10, 15, 10),
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
                                        child:latestResults?.data !=null ? ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount:
                                                latestResults!.data!.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 10, 10, 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Stack(
                                                        alignment:
                                                            Alignment.center,
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
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                20, 5, 10, 5),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              latestResults!
                                                                  .data![index]
                                                                  .deviceName
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: AppColor
                                                                      .cardDivider,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 15),
                                                            ),
                                                            SizedBox(
                                                              height: 3,
                                                            ),
                                                            Text(
                                                              latestResults!
                                                                  .data![index]
                                                                  .deviceId
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: AppColor
                                                                      .cardShadow,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 10),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              latestResults!
                                                                      .data![
                                                                          index]
                                                                      .result!
                                                                      .densityUnit! +
                                                                  " kg/m3",
                                                              style: TextStyle(
                                                                  color: AppColor
                                                                      .cardDivider,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 15),
                                                            ),
                                                            SizedBox(
                                                              height: 3,
                                                            ),
                                                            Text(
                                                              latestResults!
                                                                      .data![
                                                                          index]
                                                                      .result!
                                                                      .temperatureUnit! +
                                                                  " c",
                                                              style: TextStyle(
                                                                  color: AppColor
                                                                      .cardShadow,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 10),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTapDown: (TapDownDetails
                                                          details) {
                                                        if (latestResults!
                                                            .data![index]
                                                            .approvedStatus ==
                                                            "pending") {
                                                        _showPopupMenu(
                                                            details
                                                                .globalPosition,
                                                            latestResults!
                                                                .data![index]
                                                                .id!,
                                                            index);
                                                          }
                                                      },
                                                      child: getStatus(
                                                          latestResults!
                                                              .data![index]
                                                              .approvedStatus!),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }):Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 10, 15, 10),
                                          child: Text(
                                            "No Data Found",
                                            style: TextStyle(
                                                color: AppColor.cardDivider,

                                                fontSize: 15),
                                          ),
                                        ) ,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          // By default, show a loading spinner.
                        )
                ],
              ),
            )),
        Visibility(
          visible: isUpdateReadingLoading,
          child: Loader(),
        ),
      ],
    );
  }

  Widget getStatus(String value) {
    if (value == "approve") {
      return Container(
        padding: EdgeInsets.fromLTRB(15, 6, 15, 6),
        width: 110,
        decoration: BoxDecoration(
          color: AppColor.acceptBg,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(
          child: Text("Accepted",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColor.approvedColor)),
        ),
      );
    } else if (value == "reject") {
      return Container(
        padding: EdgeInsets.fromLTRB(15, 6, 15, 6),
        width: 110,
        decoration: BoxDecoration(
          color: AppColor.rejectBg,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(
          child: Text("Rejected",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppColor.rejectedColor)),
        ),
      );
    } else {
      return pending();
    }
  }

  void _showPopupMenu(Offset offset, String id, int index) async {
    double left = offset.dx;
    double top = offset.dy;
    var selected = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: [
        PopupMenuItem<String>(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColor.pendingBg,
              ),
              padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
              child: Row(
                children: <Widget>[
                  Text(
                    "Pending",
                    style: TextStyle(color: AppColor.pendingColor),
                  ),
                ],
              ),
            ),
            value: 'Pending'),
        PopupMenuItem<String>(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColor.acceptBg,
              ),
              padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
              child: Row(
                children: <Widget>[
                  Text("Accept",
                      style: TextStyle(color: AppColor.approvedColor)),
                ],
              ),
            ),
            value: 'Accept'),
        PopupMenuItem<String>(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColor.rejectBg,
              ),
              padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
              child: Row(
                children: <Widget>[
                  Text("Reject",
                      style: TextStyle(color: AppColor.rejectedColor)),
                ],
              ),
            ),
            value: 'Reject'),
      ],
      elevation: 8.0,
    );
    if (selected == "Accept") {
      showConfirmDialog(true,id,index);

    } else if (selected == "Reject") {
      showConfirmDialog(false,id,index);



    } else {}
  }

  void showConfirmDialog(bool isApprove, String id, int index) {
 String value= isApprove?"Accept":"Reject";
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), //this right here
            child: Container(
              height: 160,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();

                      },
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Image.asset("assets/images/cross.png",)),
                    ),

                    SizedBox(height: 20,),
                    Text('Are you sure you want to '+value+' this Result?', style: TextStyle(color: Colors.black,
                    fontSize: 15,fontWeight: FontWeight.bold),) ,

                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: isApprove?GestureDetector(
                      onTap: () async {
                        Navigator.of(context).pop();
                        isUpdateReadingLoading=true;
                        setState(() {

                        });
                        await _homeService.updateReading(id, "approve");

                        setState(() {
                          isUpdateReadingLoading=false;

                          latestResults!.data![index].approvedStatus = "approve";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15, 6, 15, 6),
                        width: 110,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColor.acceptBg,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(
                          child: Text("Accept",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.approvedColor)),
                        ),
                      ),
                    ):GestureDetector(
                      onTap: () async {
                        Navigator.of(context).pop();
                        isUpdateReadingLoading = true;
                        setState(() {});
                        await _homeService.updateReading(id, "reject");
                        setState(() {
                          isUpdateReadingLoading = false;
                          latestResults!.data![index].approvedStatus = "reject";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15, 6, 15, 6),
                        width: 110,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColor.rejectBg,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(
                          child: Text("Reject",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.rejectedColor)),
                        ),
                      ),
                    ),
                  ),
                )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
