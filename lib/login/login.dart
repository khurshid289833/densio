import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/register/register.dart';
import 'package:untitled2/services/LoginService.dart';
import 'package:untitled2/utils/InputDecoration.dart';
import 'package:untitled2/utils/appString.dart';
import 'package:untitled2/drawer/pageRoutes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/widget/alertDialog.dart';
import 'package:untitled2/widget/loader.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}
LoginService _loginService = LoginService();

class LoginState extends State<Login> {
  late bool _passwordVisible;
  bool isLoading = false;
  bool _isChecked = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    _passwordVisible = false;

     //sharedPreferences.getString("savedEmail");

  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 100, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset("assets/logo.png", height: 130,width: 130,)),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    AppString.SignIn,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    AppString.enterEmailText,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(key: _formkey,child: Column(children: [
                    TextFormField(
                      validator: (value) {
                        if(value!.isEmpty)
                        {
                          return AppString.emailRequired;
                        } if(value.contains("@") && !RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                          return AppString.invalidEmail;
                        }if(isNumeric(value)==true && value.length!=10){
                          return AppString.invalidNumber;

                        }if(value.contains("@")==false && isNumeric(value)==false){
                          return AppString.invalidNumberEmail;

                        }
                        return null;
                      },
                      controller: emailController,
                      decoration: buildInputDecoration(AppString.emailAddress),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if(value!.isEmpty)
                        {
                          return AppString.passwordRequired;
                        } if(value.length<8)
                        {
                          return AppString.passwordInvalid;
                        }
                        return null;
                      },
                      controller: passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 6, 5, 6),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                              color: Colors.black54,
                              width: 1.5
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                            color: Colors.black54,
                            width: 1.5,
                          ),
                        ),
                        enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                            color: Colors.black54,
                            width: 1.5,
                          ),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: AppString.password,
                        fillColor: Colors.white70,
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.black54,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ],))
                  ,
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 24.0,
                        width: 24.0,
                        child: Checkbox(
                          activeColor: Colors.amber,
                          value: _isChecked,
                          onChanged: (value) {
                            setState(() {
                              _isChecked = !_isChecked;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(AppString.rememberMe),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      child: Text(
                        AppString.SignIn,
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      onPressed: () async {
                        if(_formkey.currentState!.validate())
                        {
                          if(_isChecked==true){
                            sharedPreferences.setString('savedEmail',emailController.text);
                            sharedPreferences.setString('savedPassword',passwordController.text );
                          }

                          isLoading=true;
                          setState(() {

                          });
                          String response = await _loginService.loginUser(
                              emailController.text,passwordController.text
                          );

                          setState(() {
                            isLoading=false;
                            if(response == "User logged in successfully"){
                              Navigator.pushReplacementNamed(context, pageRoutes.dashboard);
                            } else{
                              showAlert(context, response);

                            }
                          });
                          return;
                        }else{

                        }

                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {

                        }, child:  Text(AppString.forgotPassword, style: TextStyle( decoration: TextDecoration.underline,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueAccent),),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  Register()),
                          );
                        }, child:  Text(AppString.SignUp, style: TextStyle( decoration: TextDecoration.underline,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueAccent),),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: isLoading,
          child: Loader(),
        ),
      ],

    );
  }
  showAlert(BuildContext context,String content) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomAlertDialog(content: content);
      },
    );
  }
  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
