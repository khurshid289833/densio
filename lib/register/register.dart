import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/register/enterOtpScreen.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/utils/appString.dart';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterState();
  }
  
}
class RegisterState extends State<Register>{
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            Text(AppString.SignUp, style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            Container(
              //height: 50,
              margin: EdgeInsets.only(top: 25),
              child: TextFormField(
                controller: firstNameController,
                validator: (val) {
                  if (val!.length == 0 || val.length<3)
                    return "Please enter a valid name";
                  else
                    return null;
                },
                cursorColor: Colors.black38,
                decoration: InputDecoration(
                  hintText: "First Name",
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
                controller: lastNameController,
                validator: (val) {
                  if (val!.length == 0 || val.length<3)
                    return "Please enter a valid name";
                  else
                    return null;
                },
                cursorColor: Colors.black38,
                decoration: InputDecoration(
                  hintText: "Last Name",
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
                controller: phoneController,
                validator: (val) {
                  if (val!.length == 0 || val.length<10)
                    return "Please enter a valid mobile number";
                  else
                    return null;
                },
                cursorColor: Colors.black38,
                decoration: InputDecoration(
                  hintText: "Mobile Number",
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
                controller: emailController,
                validator: (value) => EmailValidator.validate(value!) ? null : "Please enter a valid email address",
                cursorColor: Colors.black38,
                decoration: InputDecoration(
                  hintText: "Email Address",
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
                child: Text("Verify",
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                ),
                onPressed: (){
                  if (_formKey.currentState!.validate()) {

                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Text("Already have an account? ",
                    style: TextStyle(fontSize: 14,color: AppColor.textFieldBorderColor,fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EnterOtpScreen()));
                    },
                    child: Text("Sign in here",
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
