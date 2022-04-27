import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
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
  List<latest.Data> searchDataList = [];
  HomeScreenDetailsService _homeScreenDetailsService = HomeScreenDetailsService();

  void fetchSummaryDetails(String deviceId)async{
    final SharedPreferences _preferences = await SharedPreferences.getInstance();
    accessToken = _preferences.getString("access_token")??"";
    data = await _homeScreenDetailsService.summaryDetails(deviceId, accessToken);
    if(data.status == true){
      isLoadingSummary = false;
      notifyListeners();
    }else{
      isLoadingSummary = false;
      isErrorSummary = true;
      notifyListeners();
    }
  }

  void fetchSummaryDetailsLatestResult(String deviceId,String slotId)async{
    final SharedPreferences _preferences = await SharedPreferences.getInstance();
    accessToken = _preferences.getString("access_token")??"";
    latestResult = await _homeScreenDetailsService.summaryDetailsLatestResult(deviceId, slotId,accessToken);
    if(latestResult.status == true){
      isLoadingSummaryResult = false;
      latestDataList = latestResult.data.where((x) => x.approvedStatus=="approve" || x.approvedStatus=="reject").toList();
      searchDataList = latestDataList;
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


  filterSearchResult(String param){

    var temp = latestDataList.where((value) {

      String dateTime = value.createdDate;
      DateTime dateTimeParsed = DateTime.parse(dateTime);
      DateTime dateTimeLocal = dateTimeParsed.toLocal();
      String date = DateFormat('dd/MM/yyyy').format(dateTimeLocal);

      bool cond;
      param.length>1? cond = date.contains(param):cond=false;

      return value.id==param || cond;
    }).toList();
    searchDataList = temp;
    if(param.isEmpty){
      searchDataList = latestDataList;
    }
    notifyListeners();

  }

}
