import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/controller/summaryViewController.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/utils/appString.dart';
import 'package:provider/provider.dart';

class SummaryView extends StatefulWidget {
  const SummaryView({Key? key}) : super(key: key);

  @override
  _SummaryViewState createState() => _SummaryViewState();
}

class _SummaryViewState extends State<SummaryView> {
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    SummaryViewController provider = Provider.of<SummaryViewController>(context);
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
            padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
            child: Row(
              children: [
                Image.asset("assets/images/device.png",height: 18,width: 25),
                SizedBox(width: 8),
                Text("${AppString.model} DDM01",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
              ],
            ),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(top: 20,left: 40,right: 30),
            padding: const EdgeInsets.only(top: 10,left: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.1)),
            ),
            child: Text("${AppString.type} Petrol & Diesel",style: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
            child: Row(
              children: [
                Image.asset("assets/images/refresh.png",height: 18,width: 25),
                SizedBox(width: 8),
                Text(AppString.deviceCalibrationDetails,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
              ],
            ),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(top: 20,left: 40,right: 30),
            padding: const EdgeInsets.only(top: 10,left: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.1)),
            ),
            child: Text("${AppString.lastCalibratedDate} 23/02/2022",style: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor)),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(top: 20,left: 40,right: 30),
            padding: const EdgeInsets.only(left: 10,right: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppString.calibrationReport,style: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor)),
                SizedBox(
                  height: 21,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side:  BorderSide(color: AppColor.blueColor),
                      ),
                    ),
                    child: Text(AppString.viewReport,
                      style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold,color: AppColor.blueColor),
                    ),
                    onPressed: (){},
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(top: 20,left: 40,right: 30),
            padding: const EdgeInsets.only(top: 10,left: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.1)),
            ),
            child: Text("${AppString.nextCalibrationDate} 23/02/2022",style: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
            child: Row(
              children: [
                Image.asset("assets/images/person.png",height: 18,width: 25),
                SizedBox(width: 8),
                Text(AppString.deviceCertification,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
              ],
            ),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(top: 20,left: 40,right: 30),
            padding: const EdgeInsets.only(left: 10,right: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppString.deviceCertificateISO,style: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor)),
                SizedBox(
                  height: 21,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side:  BorderSide(color: AppColor.blueColor),
                      ),
                    ),
                    child: Text(AppString.viewCertificate,
                      style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold,color: AppColor.blueColor),
                    ),
                    onPressed: (){},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15,left: 5,right: 5),
            child: Card(
              shadowColor: AppColor.cardShadow,
              elevation: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(AppString.latestResult,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
                            Container(
                              height: 26,
                              width: 26,
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: AppColor.lightBlueBackground,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Image.asset("assets/images/download.png"),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Color(0xFFCCCEDD)),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              icon: Image.asset("assets/images/downArrow.png"),
                              hint: Text(AppString.show,style: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor,fontWeight: FontWeight.bold)),
                              items: provider.items.map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text(item, style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500)),
                                          Divider(color: Colors.black,thickness: 0.1),
                                        ],
                                      ),
                                    ),
                                  )).toList(),
                              //value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  provider.selectedValue = value as String;
                                });
                              },
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.white,
                              ),
                              itemPadding: const EdgeInsets.only(left: 0, right: 0,top: 5),
                              buttonPadding: const EdgeInsets.only(left: 10, right: 10),
                              buttonHeight: 26,
                              buttonWidth: 110,
                              itemHeight: 40,
                              dropdownWidth: 150,
                            ),
                          ),
                        ),
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
                                        padding: EdgeInsets.only(top: index==0?10:5,left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("DDM-P-01",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
                                            SizedBox(height: 5),
                                            Text("25 Jul 2021 | 11:45 PM",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColor.textFieldBorderColor)),
                                            SizedBox(height: 20),
                                            Text("739.06 kg/m3",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
                                            SizedBox(height: 5),
                                            Text("26.75 c",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColor.textFieldBorderColor)),
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
                              Padding(
                                padding: const EdgeInsets.only(left: 15,right: 15),
                                child: Divider(
                                  color: AppColor.textFieldBorderColor,
                                  height: 25,
                                  thickness: 0.1,
                                ),
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
