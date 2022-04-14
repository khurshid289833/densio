import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:untitled2/utils/appColor.dart';

class EnterOtpScreen extends StatefulWidget {
  const EnterOtpScreen({Key? key}) : super(key: key);

  @override
  _EnterOtpScreenState createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> {
  TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 50,left: 25,right: 25),
          children: [
            Image.asset("assets/images/logo.png"),
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: Text("Verification Code",
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              child: PinCodeTextField(
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // Only numbers
                validator: (val) {
                  if (val!.length == 0)
                    return "Please enter OTP sent to your registered email id";
                  else if (val.length<6)
                    return "OTP must contain 6 characters";
                  else
                    return null;
                },
                appContext: context,
                length: 6,
                cursorColor: Colors.black,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
                enableActiveFill: true,
                controller: otpController,
                onChanged: (value) {
                  print(value);
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderWidth: 1.0,
                  fieldHeight: 51,
                  fieldWidth: 44,
                  borderRadius: BorderRadius.circular(10),
                  inactiveColor: AppColor.greyColor,
                  activeColor: AppColor.greyColor,
                  selectedColor: AppColor.greyColor,
                  inactiveFillColor: AppColor.greyColor,
                  activeFillColor: AppColor.greyColor,
                  selectedFillColor: AppColor.greyColor,
                ),
                // onCompleted: (value){
                // },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              alignment: Alignment.center,
              child: Text("Resend code in 00:30 ",
                style: TextStyle(fontSize: 12,color: AppColor.blueColor,fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 42,
              margin: EdgeInsets.only(top: 10,left: 35,right: 35),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColor.blueColor,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("Verify",
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                ),
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
