import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:untitled2/model/LatestResultResponse.dart';
import 'package:untitled2/utils/appUrl.dart';
import '../main.dart';
import '../model/AllDevicesResponse.dart';
import '../model/AllDevicesResponse.dart';

class HomeService{

  Future<AllDevicesResponse?> allDevices() async {
    var  allDevicesResponse ;


    String token = sharedPreferences.getString("access_token");
    print(token);

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
     //    print(allDevicesResponse.toString());
        }

      }


    } catch (e) {
      log(e.toString());
    }
    return allDevicesResponse;
  }
  Future<LatestResultResponse?> latestResult() async {
    var  latestResultResponse ;


    String token = sharedPreferences.getString("access_token");
    print(token);

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
          //    print(allDevicesResponse.toString());
        }

      }


    } catch (e) {
      log(e.toString());
    }
    return latestResultResponse;
  }
}