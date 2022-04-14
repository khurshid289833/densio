import 'package:flutter/material.dart';
import 'package:untitled2/utils/appString.dart';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterState();
  }
  
}
class RegisterState extends State<Register>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 50,left: 20,right: 20),
        children: [
          Image.asset("assets/images/logo.png"),
          Text(
            AppString.SignUp,
            style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );

  }
  
}