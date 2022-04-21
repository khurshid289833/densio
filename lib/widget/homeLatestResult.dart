

import 'package:flutter/material.dart';
import 'package:untitled2/utils/appColor.dart';



Widget homeLatestResult() {
  return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 40,
            child: Image.asset(
              'assets/images/petrol_pump.png',
              height: 50,
            ),
          ),
          Column(children: [
            Text(
              "Device M -01",
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
          ],)
          ,

          ],),
  );

}
