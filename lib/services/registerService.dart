import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:untitled2/utils/appUrl.dart';
import '../main.dart';

class RegisterService{

  Future<String> registerUser(String firstName,String lastName,String mobileNumber,String email,String password) async {
    String result = "";

    Map data = {
      "firstName": firstName,
      "lastName": lastName,
      "contact": mobileNumber,
      "email": email,
      "password": password
    };

    print(AppUrl.registerUrl);
    var bodyEncoded = json.encode(data);
    print(bodyEncoded);

    try {

      final response = await http.post(
        Uri.parse(AppUrl.registerUrl),
        headers: {"Content-Type": "application/json"},
        body: bodyEncoded,
      );

      if (response.statusCode == 201) {
        var parsed = json.decode(utf8.decode(response.bodyBytes));
        print(parsed.toString());
        result = ((parsed["message"] as String));
        print(parsed["data"]["access_token"] as String);
        sharedPreferences.setBool('isLogin', true);
        sharedPreferences.setString('access_token',parsed["data"]["access_token"] as String);
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