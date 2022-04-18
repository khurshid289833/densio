import 'package:flutter/cupertino.dart';

class EnterPasswordController extends ChangeNotifier{

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  int strength = 0;
  String passwordStrengthText = "";
  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  void checkPassword(String value) {
    if (value.isEmpty) {
      strength = 0;
      passwordStrengthText = "";
      notifyListeners();
    } else if (value.length < 6) {
      strength = 1;
      passwordStrengthText = "Too short";
      notifyListeners();
    } else if (value.length < 8) {
      strength = 2;
      passwordStrengthText = "Weak";
      notifyListeners();
    } else {
      if (!letterReg.hasMatch(value) || !numReg.hasMatch(value)) {
        // Password length >= 8
        // But doesn't contain both letter and digit characters
        strength = 3;
        passwordStrengthText = "Good";
        notifyListeners();
      } else {
        // Password length >= 8
        // Password contains both letter and digit characters
        strength = 4;
        passwordStrengthText = "Strong";
        notifyListeners();
      }
    }
  }

  bool passwordVisible1 = true;
  bool passwordVisible2 = true;

  void togglePasswordVisible1(bool val){
    passwordVisible1 = val;
    notifyListeners();
  }

  void togglePasswordVisible2(bool val){
    passwordVisible2 = val;
    notifyListeners();
  }

}