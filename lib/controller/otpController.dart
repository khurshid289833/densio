import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtpController extends ChangeNotifier{

  final formKey = GlobalKey<FormState>();
  late TextEditingController otpController;

  int secondsRemaining = 0;
  bool enableResend = false;
  Timer? timer;

  void initialize(){
    otpController = TextEditingController();
  }

  starTimer(){
    timer?.cancel();
    timer = null;
    secondsRemaining = 30;
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
          secondsRemaining--;
          notifyListeners();
      } else {
        enableResend = true;
        notifyListeners();
      }
    });
  }

  void resendCode() {
    //other code here
    secondsRemaining = 30;
    enableResend = false;
    notifyListeners();
  }




}