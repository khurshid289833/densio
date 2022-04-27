import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled2/controller/homeDetailsController.dart';
import 'package:untitled2/home/summaryView.dart';
import 'package:untitled2/model/AllDevicesResponse.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/utils/appString.dart';
import 'package:provider/provider.dart';

class ReportView extends StatefulWidget {
  Data data;
  ReportView({Key? key,required this.data}) : super(key: key);

  @override
  _ReportViewState createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  ScrollController _scrollController = ScrollController();
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    HomeDetailsController _homeDetailsProvider = Provider.of<HomeDetailsController>(context);

    return _homeDetailsProvider.isLoadingSummaryResult?
    Center(child: CircularProgressIndicator()):
    _homeDetailsProvider.isErrorSummaryResult?Center(child: Text("Something went wrong")):
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
            padding: const EdgeInsets.only(top: 15,left: 5,right: 5,bottom: 50),
            child: Card(
              shadowColor: AppColor.cardShadow,
              elevation: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 20,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppString.reports,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
                        Container(
                          height: 36,
                          width: 129,
                          child: TextFormField(
                            controller: _searchController,
                            cursorColor: Colors.black38,
                            decoration: InputDecoration(
                              hintText: AppString.search,
                              hintStyle: TextStyle(fontSize: 15,color: AppColor.textFieldBorderColor),
                              contentPadding: EdgeInsets.only(top: 0,left: 0,bottom: 0,right: 0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:  Color(0xFFCCCEDD), width: 1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:  Color(0xFFCCCEDD), width: 1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:  Color(0xFFCCCEDD), width: 1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              focusedErrorBorder:  OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFCCCEDD), width: 1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              prefixIcon: Icon(Icons.search,size: 25,color: AppColor.blueColor),
                              prefixIconConstraints: BoxConstraints(
                                maxWidth: 40,
                                minWidth: 40,
                              ),
                            ),
                            onChanged: (value){
                              _homeDetailsProvider.filterSearchResult(value);
                            },
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
                      child: _homeDetailsProvider.searchDataList.length==0?
                      Center(child: Text("No data found")) :
                      ListView.builder(
                        controller: _scrollController,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: _homeDetailsProvider.searchDataList.length,
                        itemBuilder: (context,index){

                          String dateTime = _homeDetailsProvider.searchDataList[index].approvedOrRejectedBy.datetime;
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
                                        padding: EdgeInsets.only(top: index==0?10:5),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(widget.data.slotInfo![0].liquidType!.toTitleCase,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
                                            SizedBox(height: 8),
                                            Text("$date | $time",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColor.textFieldBorderColor)),
                                            SizedBox(height: 10),
                                            Text("Hydrometer : 739.06 kg/m3",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xFF727272))),
                                            SizedBox(height: 10),
                                            Text("Density @${_homeDetailsProvider.searchDataList[index].result.temperature} : ${_homeDetailsProvider.searchDataList[index].result.density} ${_homeDetailsProvider.searchDataList[index].result.densityUnit}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
                                            SizedBox(height: 8),
                                            Text("${_homeDetailsProvider.searchDataList[index].result.temperature} ${_homeDetailsProvider.searchDataList[index].result.temperatureUnit}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColor.textFieldBorderColor)),
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
                                          color: _homeDetailsProvider.searchDataList[index].approvedStatus=="approve"?AppColor.lightGreenBackground:AppColor.lightRedBackground,
                                          borderRadius: BorderRadius.circular(3),
                                        ),
                                        child: Center(child: Text(_homeDetailsProvider.searchDataList[index].approvedStatus=="approve"?"Accepted":"Rejected",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: _homeDetailsProvider.searchDataList[index].approvedStatus=="approve"?AppColor.greenText:AppColor.redText))),
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
