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
                    Image.asset("assets/images/cross.png"),
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
              )

            ])),
      ),
    );
  }
}
