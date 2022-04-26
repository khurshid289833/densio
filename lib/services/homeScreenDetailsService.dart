import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:untitled2/model/latestResultModel.dart' as latest;
import 'package:untitled2/model/summaryDetailsModel.dart';
import 'package:untitled2/utils/appUrl.dart';

class HomeScreenDetailsService{

  Future<SummaryDetailsModel> summaryDetails(String deviceId,String token) async {

    SummaryDetailsModel data;
    var parsed;

    print(AppUrl.summaryDetails+deviceId);

    try {

      final response = await http.get(
          Uri.parse(AppUrl.summaryDetails+deviceId),
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
            "Content-Type": "application/json"
          });


      if (response.statusCode == 200) {
        parsed = json.decode(utf8.decode(response.bodyBytes));
        print(parsed);
        data = SummaryDetailsModel.fromJson(parsed);
        return data;
      } else {
        var parsed = json.decode(utf8.decode(response.bodyBytes));
        print(parsed);
        return SummaryDetailsModel(status: false, data: Data(id: "", deviceId: "", slotId: "", certificationName: "", approvedScale: ApprovedScale(), expiryDate: "", status: "", createdDate: "", media: [], createdBy: CreatedBy(name: '', id: ''), vendor: Vendor(vendorName: '', vendorId: ''), lastCalibrationDate: "", calibrationReport: [], nextCalibrationDate: ""), message: "error", statusCode: 201);
      }
    } catch (e) {
      log(e.toString());
      return SummaryDetailsModel(status: false, data: Data(id: "", deviceId: "", slotId: "", certificationName: "", approvedScale: ApprovedScale(), expiryDate: "", status: "", createdDate: "", media: [], createdBy: CreatedBy(name: '', id: ''), vendor: Vendor(vendorName: '', vendorId: ''), lastCalibrationDate: "", calibrationReport: [], nextCalibrationDate: ""), message: "error", statusCode: 201);
    }

  }


  Future<latest.LatestResultModel> summaryDetailsLatestResult(String deviceId,String token) async {

    latest.LatestResultModel data;
    var parsed;

    print(AppUrl.summaryDetailsLatestResult+deviceId);

    try {

      final response = await http.get(
          Uri.parse(AppUrl.summaryDetailsLatestResult+deviceId),
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
            "Content-Type": "application/json"
          });


      if (response.statusCode == 200) {
        parsed = json.decode(utf8.decode(response.bodyBytes));
        print(parsed);
        data = latest.LatestResultModel.fromJson(parsed);
        return data;
      } else {
        var parsed = json.decode(utf8.decode(response.bodyBytes));
        print(parsed);
        return latest.LatestResultModel(status: false, data: [],  message: "error", statusCode: 201);
      }
    } catch (e) {
      log(e.toString());
      return latest.LatestResultModel(status: false, data: [],  message: "error", statusCode: 201);
    }

  }


}