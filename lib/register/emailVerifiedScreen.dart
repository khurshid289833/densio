import 'package:flutter/material.dart';
import 'package:untitled2/register/register.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/utils/appString.dart';
import 'enterPasswordScreen.dart';

class EmailVerifiedScreen extends StatefulWidget {
  const EmailVerifiedScreen({Key? key}) : super(key: key);

  @override
  _EmailVerifiedScreenState createState() => _EmailVerifiedScreenState();
}

class _EmailVerifiedScreenState extends State<EmailVerifiedScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 50,left: 25,right: 25),
        children: [
          Image.asset("assets/images/logo.png"),
          Container(
            margin: EdgeInsets.only(top: 100),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppString.emailVerifiedSuccessfully,
                  style: TextStyle(fontSize: screenWidth*0.062,fontWeight: FontWeight.w600),
                ),
                Image.asset("assets/images/check.png",height: screenWidth*0.062),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 38,
                width: screenWidth*0.37,
                margin: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.blueColor,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(AppString.continueText,
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EnterPasswordScreen()));
                  },
                ),
              ),
              Container(
                height: 38,
                width: screenWidth*0.37,
                margin: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF979797),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(AppString.cancel,
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Register()), (route) => false);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
