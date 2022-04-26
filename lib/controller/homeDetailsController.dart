import 'package:flutter/cupertino.dart';
import 'package:untitled2/model/latestResultModel.dart' as latest;
import 'package:untitled2/model/summaryDetailsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/services/homeScreenDetailsService.dart';

class HomeDetailsController extends ChangeNotifier{

  ///Home Details///
  late PageController pageController;
  int selectedIndex = 0;

  void reset() {
    selectedIndex = 0;
    isLoadingSummary = true;
    isErrorSummary = false;
    isLoadingSummaryResult = true;
    isErrorSummaryResult = false;
    isFilter = false;
    latestDataList.clear();
  }


  ///Summary screen///
  String? selectedValue;
  List<String> items = ["Last 7 Days","Last 15 Days","Last 30 Days"];

  String accessToken = "";
  bool isLoadingSummary = true;
  bool isErrorSummary = false;
  bool isLoadingSummaryResult = true;
  bool isErrorSummaryResult = false;
  bool isFilter = false;
  late SummaryDetailsModel data;
  late latest.LatestResultModel latestResult;
  List<latest.Data> latestDataList = [];
  List<latest.Data> filterDataList = [];
  HomeScreenDetailsService _homeScreenDetailsService = HomeScreenDetailsService();

  void fetchSummaryDetails()async{
    final SharedPreferences _preferences = await SharedPreferences.getInstance();
    accessToken = _preferences.getString("access_token")??"";
    data = await _homeScreenDetailsService.summaryDetails("dev101", accessToken);
    if(data.status == true){
      isLoadingSummary = false;
      notifyListeners();
    }else{
      isLoadingSummary = false;
      isErrorSummary = true;
      notifyListeners();
    }
  }

  void fetchSummaryDetailsLatestResult()async{
    final SharedPreferences _preferences = await SharedPreferences.getInstance();
    accessToken = _preferences.getString("access_token")??"";
    latestResult = await _homeScreenDetailsService.summaryDetailsLatestResult("dev101", accessToken);
    if(latestResult.status == true){
      isLoadingSummaryResult = false;
      latestDataList = latestResult.data.where((x) => x.approvedStatus=="approve" || x.approvedStatus=="reject").toList();
      notifyListeners();
    }else{
      isLoadingSummaryResult = false;
      isErrorSummaryResult = true;
      notifyListeners();
    }
  }

  filterData(String value){
    print(value);
    var now = new DateTime.now();
    var now_1w = now.subtract(Duration(days: 7));
    var now_15d = now.subtract(Duration(days: 15));
    var now_1m = new DateTime(now.year, now.month-1, now.day);

    filterDataList = latestDataList.where((x) {
      String dateTime = x.approvedOrRejectedBy.datetime;
      DateTime dateTimeParsed = DateTime.parse(dateTime);
      DateTime dateTimeLocal = dateTimeParsed.toLocal();
      return value=="Last 7 Days"? now_1w.isBefore(dateTimeLocal):
      value=="Last 15 Days"? now_15d.isBefore(dateTimeLocal) :
      now_1m.isBefore(dateTimeLocal);
    }).toList();

    isFilter = true;
    notifyListeners();
  }

}
