import 'package:flutter/material.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/utils/appString.dart';

class ReportView extends StatefulWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  _ReportViewState createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        padding: EdgeInsets.only(top: 20),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("DDM-P-01",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
                Image.asset("assets/images/cross.png"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15,left: 5,right: 5,bottom: 50),
            child: Card(
              shadowColor: AppColor.cardShadow,
              elevation: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppString.reports,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColor.textFieldBorderColor,
                    height: 30,
                    thickness: 0.1,
                  ),
                  Scrollbar(
                    controller: _scrollController,
                    isAlwaysShown: true,
                    showTrackOnHover: true,
                    thickness: 5,
                    child: Container(
                      height: 500,
                      child: ListView.builder(
                        controller: _scrollController,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context,index){
                          return Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColor.lightGreenBackground
                                        ),
                                        child: Image.asset("assets/images/pump.png",height: 24,width: 24),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: index==0?10:5),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Petrol",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
                                            SizedBox(height: 8),
                                            Text("25 Jul 2021 | 11:45 PM",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColor.textFieldBorderColor)),
                                            SizedBox(height: 10),
                                            Text("Hydrometer : 739.06 kg/m3",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xFF727272))),
                                            SizedBox(height: 10),
                                            Text("Density @15 : 739.06 kg/m3",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
                                            SizedBox(height: 8),
                                            Text("26.75 c",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColor.textFieldBorderColor)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        height: 27,
                                        //width: 90,
                                        margin: EdgeInsets.only(right: 40),
                                        decoration: BoxDecoration(
                                          color: index.isOdd?AppColor.lightGreenBackground:AppColor.lightRedBackground,
                                          borderRadius: BorderRadius.circular(3),
                                        ),
                                        child: Center(child: Text(index.isOdd?"Accepted":"Rejected",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: index.isOdd?AppColor.greenText:AppColor.redText))),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: AppColor.textFieldBorderColor,
                                height: 25,
                                thickness: 0.1,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
