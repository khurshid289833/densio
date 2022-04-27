import 'package:flutter/material.dart';
import 'package:untitled2/utils/appString.dart';

import '../utils/appColor.dart';

class Certificate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CertificateState();
  }
}

class CertificateState extends State<Certificate> {
  TextEditingController _searchController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("DDM-P-01",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColor.textFieldBorderColor)),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Image.asset("assets/images/cross.png"),
                    ),
                  ],
                ),
              ),
              Card(
                shadowColor: AppColor.cardShadow,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text(
                        AppString.isoCeritificate,
                        style: TextStyle(
                            color: AppColor.cardDivider,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                    Divider(
                      color: AppColor.greyColor,
                      height: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Row(
                        children: [
                          Text(AppString.id,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.textFieldBorderColor)),
                          Text("23456",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.textFieldBorderColor))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Row(
                        children: [
                          Text(AppString.name,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.textFieldBorderColor)),
                          Text("Certificate 1",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.textFieldBorderColor))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Row(
                        children: [
                          Text(AppString.date,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.textFieldBorderColor)),
                          Text("22 April 2022 | 11:11 AM",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.textFieldBorderColor))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 10, 10),
                      child: Align(

                          alignment: Alignment.bottomRight,child: Image.asset("assets/images/download_certificate.png",height: 25,)),
                    )

                  ],
                ),
              ),

              SizedBox(height: 20,),

              Card(
                shadowColor: AppColor.cardShadow,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text(
                        AppString.caliberationCertificate,
                        style: TextStyle(
                            color: AppColor.cardDivider,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                    Divider(
                      color: AppColor.greyColor,
                      height: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Row(
                        children: [
                          Text(AppString.id,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.textFieldBorderColor)),
                          Text("23456",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.textFieldBorderColor))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Row(
                        children: [
                          Text(AppString.name,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.textFieldBorderColor)),
                          Text("Certificate 1",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.textFieldBorderColor))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Row(
                        children: [
                          Text(AppString.date,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.textFieldBorderColor)),
                          Text("22 April 2022 | 11:11 AM",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.textFieldBorderColor))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 10, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Image.asset("assets/images/active.png",height: 15,),

                        Image.asset("assets/images/download_certificate.png",height: 25,),
                      ],)
                    )

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
                            Text(AppString.certificate,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
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
                                            padding: EdgeInsets.only(top: index==0?10:5),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Cerificate 4",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: AppColor.textFieldBorderColor)),
                                                SizedBox(height: 8),
                                                Text("ID : 123456",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColor.textFieldBorderColor)),
                                                SizedBox(height: 10),
                                                Text("25 Jul 2021 | 11:45 PM",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColor.textFieldBorderColor)),
                                                SizedBox(height: 10),
                                                   ],
                                            ),
                                          ),
                                        ),
                                        Expanded(

                                          flex: 2,
                                          child: Align(alignment: Alignment.bottomLeft,
                              child:index.isEven?Image.asset("assets/images/active.png",height: 16,):
                              Image.asset("assets/images/inactive.png",height: 16,),)
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
            ])),
      ),
    );
  }
}
