import 'package:flutter/material.dart';
import 'package:untitled2/utils/appColor.dart';

Widget createDrawerBodyItem(
    {IconData? icon, String? text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text!,style: TextStyle(color: AppColor.drawerText,fontWeight: FontWeight.bold),),
        )
      ],
    ),
    onTap: onTap,
  );
}