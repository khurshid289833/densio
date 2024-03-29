import 'package:flutter/material.dart';
import 'package:untitled2/controller/homeDetailsController.dart';
import 'package:untitled2/drawer/navigationDrawer.dart';
import 'package:untitled2/home/reportView.dart';
import 'package:untitled2/home/certificates.dart';
import 'package:untitled2/home/summaryView.dart';
import 'package:untitled2/home/warrantyView.dart';
import 'package:untitled2/model/AllDevicesResponse.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/utils/appString.dart';
import 'package:provider/provider.dart';

class HomeDetailsScreen extends StatefulWidget {
  Data data;
  HomeDetailsScreen({Key? key,required this.data}) : super(key: key);

  @override
  _HomeDetailsScreenState createState() => _HomeDetailsScreenState();
}

class _HomeDetailsScreenState extends State<HomeDetailsScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  late HomeDetailsController provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<HomeDetailsController>(context,listen: false);
    provider.pageController = PageController();
    provider.pageController.addListener(() {
      setState(() {
        provider.selectedIndex = provider.pageController.page!.toInt();
      });
    });
    provider.fetchSummaryDetails(widget.data.deviceId!);
    provider.fetchSummaryDetailsLatestResult(widget.data.deviceId!,widget.data.slotInfo![0].id!);
  }

  @override
  void dispose() {
    provider.pageController.dispose();
    provider.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
                padding: EdgeInsets.fromLTRB(10,0,10,0),
                color: Colors.white,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/logo.png"),
                    GestureDetector(
                      onTap:(){
                        _key.currentState!.openDrawer();
                      },
                      child: Icon(Icons.sort),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
                height: 65,
                width: screenWidth,
                color: AppColor.summaryBg,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        provider.pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
                      },
                      child: Container(
                        //width: screenWidth*0.23,
                        child: Column(
                          children: [
                            Image.asset("assets/images/summary_icon.png",color: provider.selectedIndex==0?AppColor.blueColor:AppColor.textFieldBorderColor,height: 20,width: 20),
                            SizedBox(height: 4),
                            Text(AppString.summary,style: TextStyle(fontSize: 11,fontWeight: FontWeight.w700,color: provider.selectedIndex==0?AppColor.blueColor:AppColor.textFieldBorderColor)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        provider.pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.ease);
                      },
                      child: Container(
                        //width: screenWidth*0.23,
                        child: Column(
                          children: [
                            Image.asset("assets/images/report_icon.png",color: provider.selectedIndex==1?AppColor.blueColor:AppColor.textFieldBorderColor,height: 20,width: 25,fit: BoxFit.cover,),
                            SizedBox(height: 4),
                            Text(AppString.report,style: TextStyle(fontSize: 11,fontWeight: FontWeight.w700,color: provider.selectedIndex==1?AppColor.blueColor:AppColor.textFieldBorderColor)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        provider.pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.ease);
                      },
                      child: Container(
                        //width: screenWidth*0.23,
                        child: Column(
                          children: [
                            Image.asset("assets/images/certificate.png",color: provider.selectedIndex==2?AppColor.blueColor:AppColor.textFieldBorderColor,height: 22,width: 20,fit: BoxFit.cover,),
                            SizedBox(height: 2),
                            Text(AppString.certificate,style: TextStyle(fontSize: 11,fontWeight: FontWeight.w700,color: provider.selectedIndex==2?AppColor.blueColor:AppColor.textFieldBorderColor)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        provider.pageController.animateToPage(3, duration: Duration(milliseconds: 500), curve: Curves.ease);
                      },
                      child: Container(
                        //width: screenWidth*0.23,
                        child: Column(
                          children: [
                            Image.asset("assets/images/guarantee.png",color: provider.selectedIndex==3?AppColor.blueColor:AppColor.textFieldBorderColor,height: 22,width: 28,fit: BoxFit.cover,),
                            SizedBox(height: 2),
                            Text(AppString.warranty,style: TextStyle(fontSize: 11,fontWeight: FontWeight.w700,color: provider.selectedIndex==3?AppColor.blueColor:AppColor.textFieldBorderColor)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 40,
                child: PageView(
                  controller: provider.pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    SummaryView(data: widget.data),
                    ReportView(data: widget.data),
                    Certificate(),
                    WarrantyView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
