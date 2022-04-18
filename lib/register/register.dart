import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled2/controller/registerController.dart';
import 'package:untitled2/register/enterOtpScreen.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/utils/appString.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterState();
  }
  
}
class RegisterState extends State<Register>{
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    RegisterController provider = Provider.of<RegisterController>(context);
    // TODO: implement build
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 50,left: 25,right: 25),
          children: [
            Image.asset("assets/images/logo.png"),
            Text(AppString.SignUp, style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            Container(
              //height: 50,
              margin: EdgeInsets.only(top: 25),
              child: TextFormField(
                controller: provider.firstNameController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                ], //
                validator: (val) {
                  if (val!.length == 0 || val.length<3)
                    return "Please enter a valid name";
                  else
                    return null;
                },
                cursorColor: Colors.black38,
                decoration: InputDecoration(
                  hintText: AppString.firstName,
                  hintStyle: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor,letterSpacing: 0.9),
                  contentPadding: EdgeInsets.only(top: 0,left: 15,bottom: 0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.textFieldBorderColor.withOpacity(0.92), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.textFieldBorderColor.withOpacity(0.92), width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.textFieldBorderColor.withOpacity(0.92), width: 1),
                  ),
                  focusedErrorBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.textFieldBorderColor.withOpacity(0.92), width: 1),
                  ),
                ),
              ),
            ),
            Container(
              //height: 50,
              margin: EdgeInsets.only(top: 10),
              child: TextFormField(
                controller: provider.lastNameController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                ], //
                validator: (val) {
                  if (val!.length == 0 || val.length<3)
                    return "Please enter a valid name";
                  else
                    return null;
                },
                cursorColor: Colors.black38,
                decoration: InputDecoration(
                  hintText: AppString.lastName,
                  hintStyle: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor,letterSpacing: 0.9),
                  contentPadding: EdgeInsets.only(top: 0,left: 15,bottom: 0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.textFieldBorderColor.withOpacity(0.92), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.textFieldBorderColor.withOpacity(0.92), width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.textFieldBorderColor.withOpacity(0.92), width: 1),
                  ),
                  focusedErrorBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.textFieldBorderColor.withOpacity(0.92), width: 1),
                  ),
                ),
              ),
            ),
            Container(
             //height: 50,
              margin: EdgeInsets.only(top: 10),
              child: TextFormField(
                controller: provider.phoneController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ], // O
                validator: (val) {
                  if (val!.length == 0 || val.length<10)
                    return "Please enter a valid mobile number";
                  else
                    return null;
                },
                maxLength: 10,
                keyboardType: TextInputType.number,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                cursorColor: Colors.black38,
                decoration: InputDecoration(
                  counterText: "",
                  hintText: AppString.mobileNumber,
                  hintStyle: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor,letterSpacing: 0.9),
                  contentPadding: EdgeInsets.only(top: 0,left: 15,bottom: 0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.textFieldBorderColor.withOpacity(0.92), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.textFieldBorderColor.withOpacity(0.92), width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.textFieldBorderColor.withOpacity(0.92), width: 1),
                  ),
                  focusedErrorBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.textFieldBorderColor.withOpacity(0.92), width: 1),
                  ),
                ),
              ),
            ),
            Container(
              //height: 50,
              margin: EdgeInsets.only(top: 10),
              child: TextFormField(
                controller: provider.emailController,
                validator: (value) => EmailValidator.validate(value!) ? null : "Please enter a valid email address",
                cursorColor: Colors.black38,
                decoration: InputDecoration(
                  hintText: AppString.emailAddress,
                  hintStyle: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor,letterSpacing: 0.9),
                  contentPadding: EdgeInsets.only(top: 0,left: 15,bottom: 0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.textFieldBorderColor.withOpacity(0.92), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.textFieldBorderColor.withOpacity(0.92), width: 1),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.textFieldBorderColor.withOpacity(0.92), width: 1),
                  ),
                  focusedErrorBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.textFieldBorderColor.withOpacity(0.92), width: 1),
                  ),
                ),
              ),
            ),
            Container(
              height: 38,
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColor.blueColor,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text(AppString.verify,
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                ),
                onPressed: (){
                  if (formKey.currentState!.validate()) {
                    print(provider.firstNameController.text);
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Text(AppString.alreadyHaveAnAccount,
                    style: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor,fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EnterOtpScreen()));
                    },
                    child: Text(AppString.signInHere,
                      style: TextStyle(fontSize: 14,color: AppColor.blueColor,fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
