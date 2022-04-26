import 'package:flutter/material.dart';
import 'package:untitled2/model/AllDevicesResponse.dart';

import '../home/homeDetailsScreen.dart';
import 'appColor.dart';

Card homeScreenCard(int index,BuildContext context,Data? data) {
  return Card(
    shadowColor: AppColor.cardShadow,
    margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
    child: Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/petrol_pump.png',
            height: 50,
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            data!.deviceName!,
            style: TextStyle(
                color: AppColor.cardDivider,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "Id- Abcdegh",
            style: TextStyle(
                color: AppColor.cardShadow,
                fontWeight: FontWeight.bold,
                fontSize: 10),
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Image.asset('assets/images/drops.png', height: 30),
              SizedBox(
                width: 10,
              ),
              Text(
                data.slotInfo![0].liquidType.toString(),
                style: TextStyle(
                    color: AppColor.cardShadow,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              )
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Image.asset('assets/images/selected_green_dot.png', height: 30),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Calibrated",
                    style: TextStyle(color: AppColor.calibrated, fontSize: 15),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "10-4-2022",
                    style: TextStyle(color: AppColor.cardShadow, fontSize: 13),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/green_rounded_dot.png', height: 30),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Connected",
                      style: TextStyle(
                          color: AppColor.calibrated, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Online",
                      style: TextStyle(
                          color: AppColor.cardShadow, fontSize: 13),
                    ),
                  ],
                ),
              ),

              Image.asset('assets/images/wifi.png', height: 17),
              SizedBox(
                width: 20,
              ),
              GestureDetector(onTap:()async{
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeDetailsScreen()));
              }, child: Image.asset(
                  'assets/images/viewmore.png', width: 90, height: 30)),
            ],
          ),


        ],
      ),
    ),
  );
}
