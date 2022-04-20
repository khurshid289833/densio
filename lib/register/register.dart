import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled2/controller/registerController.dart';
import 'package:untitled2/services/registerService.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/utils/appString.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/drawer/pageRoutes.dart';
import 'package:untitled2/widget/alertDialog.dart';
import 'package:untitled2/widget/loader.dart';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterState();
  }
  
}

class RegisterState extends State<Register>{
  final formKey = GlobalKey<FormState>();
  RegisterService _registerService = RegisterService();

  showAlert(BuildContext context,String content) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomAlertDialog(content: content);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    RegisterController provider = Provider.of<RegisterController>(context);

    return Stack(
      children: [
        Scaffold(
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
                  margin: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    controller: provider.passwordController,
                    validator: (val) {
                      if (val!.length == 0 || val.length<8 || !val.contains(RegExp("^(?=.*[a-zA-Z])(?=.*[0-9])[A-Za-z0-9]")))
                        return "Password must contain 7 characters and 1 numerical";
                      else
                        return null;
                    },
                    cursorColor: Colors.black38,
                    onChanged: (value){
                      provider.checkPassword(value);
                    },
                    obscureText: provider.passwordVisible1,
                    decoration: InputDecoration(
                      hintText: AppString.password,
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
                      suffixIcon: IconButton(
                        icon: Icon(
                          provider.passwordVisible1 ?  Icons.visibility_off_outlined : Icons.visibility_outlined ,
                          color: Color(0xFF223354),
                        ),
                        onPressed: () {
                          provider.togglePasswordVisible1(!provider.passwordVisible1);
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    controller: provider.confirmPasswordController,
                    validator: (val) {
                      if(provider.passwordController.text.isNotEmpty)
                        if (val!.length == 0 || provider.passwordController.text!=val)
                          return "Password does not match";
                        else
                          return null;
                    },
                    obscureText: provider.passwordVisible2,
                    cursorColor: Colors.black38,
                    decoration: InputDecoration(
                      hintText: AppString.confirmPassword,
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
                      suffixIcon: IconButton(
                        icon: Icon(
                          provider.passwordVisible2 ?  Icons.visibility_off_outlined : Icons.visibility_outlined,
                          color: Color(0xFF223354),
                        ),
                        onPressed: () {
                          provider.togglePasswordVisible2(!provider.passwordVisible2);
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 4,
                        width: screenWidth*0.1,
                        color:
                        provider.strength==1?
                        Color(0xFFDC6A00):
                        provider.strength==2?
                        Color(0xFFFFCD4E):
                        provider.strength==3?
                        Color(0xFF3BB900):
                        provider.strength==4?
                        Color(0xFF3BB900):
                        AppColor.greyColor,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 4,
                        width: screenWidth*0.1,
                        color:
                        provider.strength==2?
                        Color(0xFFFFCD4E):
                        provider.strength==3?
                        Color(0xFF3BB900):
                        provider.strength==4?
                        Color(0xFF3BB900):
                        AppColor.greyColor,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 4,
                        width: screenWidth*0.1,
                        color:
                        provider.strength==3?
                        Color(0xFF3BB900):
                        provider.strength==4?
                        Color(0xFF3BB900):
                        AppColor.greyColor,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 4,
                        width: screenWidth*0.1,
                        color:
                        provider.strength==4?
                        Color(0xFF3BB900):
                        AppColor.greyColor,
                      ),
                    ],
                  ),
                ),
                if(provider.passwordStrengthText!="")
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text("${provider.passwordStrengthText}",style: TextStyle(fontSize: 12,letterSpacing: 0.5)),
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
                    child: Text(AppString.SignUp,
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                    ),
                    onPressed: ()async{
                      if (formKey.currentState!.validate()) {
                        provider.changeLoadingStatus(true);
                        String response = await _registerService.registerUser(
                            provider.firstNameController.text,
                            provider.lastNameController.text,
                            provider.phoneController.text,
                            provider.emailController.text,
                            provider.passwordController.text
                        );
                        provider.changeLoadingStatus(false);
                        if(response == "User registered successfully")
                          Navigator.pushReplacementNamed(context, pageRoutes.dashboard);
                        else if(response == "Contact number already exists")
                          showAlert(context, "Contact number already exists");
                        else if(response == "Email already exists")
                          showAlert(context, "Email already exists");
                        else
                          showAlert(context, "something went wrong");
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
                          Navigator.of(context).pop();
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
        ),
        Visibility(
          visible: provider.isLoading,
          child: Loader(),
        ),
      ],
    );
  }
}
