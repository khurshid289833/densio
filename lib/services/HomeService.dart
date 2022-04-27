import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:untitled2/model/LatestResultResponse.dart';
import 'package:untitled2/utils/appUrl.dart';
import '../main.dart';
import '../model/AllDevicesResponse.dart';
import '../model/AllDevicesResponse.dart';
import '../model/ReadingUpdateResponse.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled2/drawer/pageRoutes.dart';

class HomeService{

  Future<AllDevicesResponse?> allDevices(BuildContext context) async {
    var  allDevicesResponse ;


    String token = sharedPreferences.getString("access_token");

    try {

      final response = await http.get(
        Uri.parse(AppUrl.allDevicesUrl),
        headers: {"Content-Type": "application/json","Authorization" : "Bearer $token"},

      );

      if (response.statusCode == 200) {
        var parsed = json.decode(utf8.decode(response.bodyBytes));

        bool status= ((parsed["status"] as bool));

        if(status==true){
            allDevicesResponse= AllDevicesResponse.fromJson(json.decode(response.body));
        }

      }else if(response.statusCode == 401){
        Fluttertoast.showToast(
            msg:   ("Token Expired"),  // message
            toastLength: Toast.LENGTH_SHORT, // length
            gravity: ToastGravity.BOTTOM,    // location
            timeInSecForIosWeb: 1               // duration
        );
        sharedPreferences.setBool('isLogin', false);
        Navigator.pushReplacementNamed(context, pageRoutes.login);

      }


    } catch (e) {
      log(e.toString());
    }
    return allDevicesResponse;
  }
  Future<LatestResultResponse?> latestResult(BuildContext context) async {
    var  latestResultResponse ;


    String token = sharedPreferences.getString("access_token");

    try {

      final response = await http.get(
        Uri.parse(AppUrl.latestResultsUrl),
        headers: {"Content-Type": "application/json","Authorization" : "Bearer $token"},

      );

      if (response.statusCode == 200) {
        var parsed = json.decode(utf8.decode(response.bodyBytes));

        bool status= ((parsed["status"] as bool));

        if(status==true){
          latestResultResponse= LatestResultResponse.fromJson(json.decode(response.body));
        }

      }else if(response.statusCode == 401){
        Fluttertoast.showToast(
            msg:   ("Token Expired"),  // message
            toastLength: Toast.LENGTH_SHORT, // length
            gravity: ToastGravity.BOTTOM,    // location
            timeInSecForIosWeb: 1               // duration
        );
        sharedPreferences.setBool('isLogin', false);
        Navigator.pushReplacementNamed(context, pageRoutes.login);

      }


    } catch (e) {
      log(e.toString());
    }
    return latestResultResponse;
  }

  Future<ReadingUpdateResponse?> updateReading(String id,String status) async {
    var  readingResponse ;


    String token = sharedPreferences.getString("access_token");
    Map data = {
      "id": id,
      "status": status,

    };
    var bodyEncoded = json.encode(data);

    try {

      final response = await http.post(
        Uri.parse(AppUrl.updateReading),
        headers: {"Content-Type": "application/json","Authorization" : "Bearer $token"},
        body: bodyEncoded,
      );

      if (response.statusCode == 200) {
        var parsed = json.decode(utf8.decode(response.bodyBytes));

        bool status= ((parsed["status"] as bool));

        if(status==true){
          readingResponse= ReadingUpdateResponse.fromJson(json.decode(response.body));
          Fluttertoast.showToast(
              msg:   ((parsed["message"] as String)),  // message
              toastLength: Toast.LENGTH_SHORT, // length
              gravity: ToastGravity.BOTTOM,    // location
              timeInSecForIosWeb: 1               // duration
          );
        }

      }


    } catch (e) {
      log(e.toString());
    }
    return readingResponse;
  }
}