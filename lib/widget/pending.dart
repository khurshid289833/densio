import 'package:flutter/material.dart';
import 'package:untitled2/utils/appColor.dart';


Widget pending() {
  return Container(
    padding: EdgeInsets.fromLTRB(15, 6, 15, 6),
    width: 100,

    decoration: BoxDecoration(
      color: AppColor.pendingBg,
      borderRadius: BorderRadius.circular(3),
    ),
    child: Center(child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text("Pending",style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: AppColor.pendingColor)),SizedBox(width: 5,),Image.asset(
      'assets/images/dropdown_pending.png',
      height: 8,
    ),],)),
  );

}
