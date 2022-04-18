import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/controller/enterPasswordController.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/utils/appString.dart';

class EnterPasswordScreen extends StatefulWidget {
  const EnterPasswordScreen({Key? key}) : super(key: key);

  @override
  _EnterPasswordScreenState createState() => _EnterPasswordScreenState();
}

class _EnterPasswordScreenState extends State<EnterPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    EnterPasswordController provider = Provider.of<EnterPasswordController>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(AppString.enterPassword,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: TextFormField(
                controller: provider.passwordController,
                validator: (val) {
                  if (val!.length == 0 || val.length<7 || !val.contains(RegExp("^(?=.*[a-zA-Z])(?=.*[0-9])[A-Za-z0-9]")))
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
                      provider.passwordVisible1 ? Icons.visibility_outlined : Icons.visibility_off_outlined,
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
                      provider.passwordVisible2 ? Icons.visibility_outlined : Icons.visibility_off_outlined,
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
                child: Text(AppString.signIn,
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                ),
                onPressed: (){
                  if (formKey.currentState!.validate()) {
                    print(provider.passwordController.text);
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
