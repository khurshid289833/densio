import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:untitled2/utils/appUrl.dart';
import '../main.dart';

class LoginService{

  Future<String> loginUser(String userName,String password) async {
    String result = "";

    Map data = {
      "username": userName,
      "password": password,

    };

    print(AppUrl.loginUrl);
    var bodyEncoded = json.encode(data);
    print(bodyEncoded);

    try {

      final response = await http.post(
        Uri.parse(AppUrl.loginUrl),
        headers: {"Content-Type": "application/json"},
        body: bodyEncoded,
      );

      if (response.statusCode == 200) {
        var parsed = json.decode(utf8.decode(response.bodyBytes));
        print(parsed.toString());
        result = ((parsed["message"] as String));
        bool status= ((parsed["status"] as bool));

        if(status==true){
            sharedPreferences.setBool('isLogin', true);
          sharedPreferences.setString('access_token',parsed["data"]["access_token"] as String);

        }

       } else {
        var parsed = json.decode(utf8.decode(response.bodyBytes));
        print(parsed.toString());
        result = ((parsed["message"] as String));
      }


    } catch (e) {
      log(e.toString());
    }
    return result;
  }




}