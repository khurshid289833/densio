import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/controller/homeDetailsController.dart';
import 'package:untitled2/model/AllDevicesResponse.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/utils/appString.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class SummaryView extends StatefulWidget {
  Data data;
  SummaryView({Key? key,required this.data}) : super(key: key);

  @override
  _SummaryViewState createState() => _SummaryViewState();
}

class _SummaryViewState extends State<SummaryView> {

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    HomeDetailsController _homeDetailsProvider = Provider.of<HomeDetailsController>(context);
    return _homeDetailsProvider.isLoadingSummary?
    Center(child: CircularProgressIndicator(),):
    _homeDetailsProvider.isErrorSummary?Center(child: Text("Something went wrong"),):
      Container(
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
                Text(widget.data.deviceName!,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Image.asset("assets/images/cross.png"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
            child: Row(
              children: [
                Image.asset("assets/images/device.png",height: 18,width: 25),
                SizedBox(width: 8),
                Text("${AppString.model} ${widget.data.model!}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
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
            child: Text("${AppString.type} ${widget.data.slotInfo![0].liquidType!.toTitleCase}",style: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor)),
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
            child: Text("${AppString.lastCalibratedDate} ${splitDate(_homeDetailsProvider.data.data.lastCalibrationDate)}",style: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor)),
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
                    onPressed: (){
                      _homeDetailsProvider.pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.ease);
                    },
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
            child: Text("${AppString.nextCalibrationDate} ${splitDate(_homeDetailsProvider.data.data.nextCalibrationDate)}",style: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor)),
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
                    onPressed: (){
                      _homeDetailsProvider.pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.ease);
                    },
                  ),
                ),
              ],
            ),
          ),

          _homeDetailsProvider.isLoadingSummaryResult?
          Container(height:300,child: Center(child: CircularProgressIndicator(),)):
          _homeDetailsProvider.isErrorSummaryResult?Container():
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
                              items: _homeDetailsProvider.items.map((item) => DropdownMenuItem<String>(
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
                              //value: _homeDetailsProvider.selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  _homeDetailsProvider.selectedValue = value as String;
                                  _homeDetailsProvider.filterData(_homeDetailsProvider.selectedValue!);
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
                        itemCount: _homeDetailsProvider.isFilter?
                        _homeDetailsProvider.filterDataList.length>10?10:_homeDetailsProvider.filterDataList.length:
                        _homeDetailsProvider.latestDataList.length>10?10:_homeDetailsProvider.latestDataList.length,
                        itemBuilder: (context,index){

                          String dateTime = _homeDetailsProvider.isFilter?_homeDetailsProvider.filterDataList[index].approvedOrRejectedBy.datetime:_homeDetailsProvider.latestDataList[index].approvedOrRejectedBy.datetime;
                          DateTime dateTimeParsed = DateTime.parse(dateTime);
                          DateTime dateTimeLocal = dateTimeParsed.toLocal();
                          String date = DateFormat('dd MMMM yyyy').format(dateTimeLocal);
                          String time = DateFormat('hh:mm a').format(dateTimeLocal);
                          print(date);
                          print(time);

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
                                            Text(_homeDetailsProvider.isFilter?_homeDetailsProvider.filterDataList[index].deviceName:_homeDetailsProvider.latestDataList[index].deviceName,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
                                            SizedBox(height: 5),
                                            Text("$date | $time",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColor.textFieldBorderColor)),
                                            SizedBox(height: 20),
                                            Text("${_homeDetailsProvider.isFilter?_homeDetailsProvider.filterDataList[index].result.density:_homeDetailsProvider.latestDataList[index].result.density} ${_homeDetailsProvider.isFilter?_homeDetailsProvider.filterDataList[index].result.densityUnit:_homeDetailsProvider.latestDataList[index].result.densityUnit}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
                                            SizedBox(height: 5),
                                            Text("${_homeDetailsProvider.isFilter?_homeDetailsProvider.filterDataList[index].result.temperature:_homeDetailsProvider.latestDataList[index].result.temperature} ${_homeDetailsProvider.isFilter?_homeDetailsProvider.filterDataList[index].result.temperatureUnit:_homeDetailsProvider.latestDataList[index].result.temperatureUnit}",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColor.textFieldBorderColor)),
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
                                          color: _homeDetailsProvider.isFilter?
                                          _homeDetailsProvider.filterDataList[index].approvedStatus=="approve"? AppColor.lightGreenBackground:AppColor.lightRedBackground:
                                          _homeDetailsProvider.latestDataList[index].approvedStatus=="approve"? AppColor.lightGreenBackground:AppColor.lightRedBackground,
                                          borderRadius: BorderRadius.circular(3),
                                        ),
                                        child: Center(child: Text(_homeDetailsProvider.isFilter?_homeDetailsProvider.filterDataList[index].approvedStatus=="approve"?"Accepted":"Rejected":_homeDetailsProvider.latestDataList[index].approvedStatus=="approve"?"Accepted":"Rejected",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: _homeDetailsProvider.isFilter?_homeDetailsProvider.filterDataList[index].approvedStatus=="approve"?AppColor.greenText:AppColor.redText:_homeDetailsProvider.latestDataList[index].approvedStatus=="approve"?AppColor.greenText:AppColor.redText))),
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

  String splitDate(String date) {
    List<String> dateLocal = date.split("-");
    String result = "${dateLocal[2]}/${dateLocal[1]}/${dateLocal[0]}";
    return result;
  }


}


extension StringCasingExtension on String {
  String toCapitalized() => this.length > 0 ?'${this[0].toUpperCase()}${this.substring(1)}':'';
  String get toTitleCase => this.replaceAll(RegExp(' +'), ' ').split(" ").map((str) => str.toCapitalized()).join(" ");
}
