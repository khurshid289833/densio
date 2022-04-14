import 'package:flutter/material.dart';
import 'package:untitled2/utils/appString.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  late bool _passwordVisible;
  bool _isChecked = false;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset("assets/logo.png")),
            SizedBox(
              height: 35,
            ),
            Text(
              AppString.SignIn,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
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
            TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 6, 5, 6),
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: AppString.emailAddress,
                  fillColor: Colors.white70),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 6, 5, 6),
                border: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: AppString.password,
                fillColor: Colors.white70,
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
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
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = !_isChecked;
                      });
                    },
                  ),
                ),
                SizedBox(width: 5,),
                Text(AppString.rememberMe),
              ],
            ),SizedBox(
              height: 35,
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(

                child: Text(AppString.SignIn, style: TextStyle(fontSize: 20.0,color: Colors.white),),
              style:ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,

                  textStyle: TextStyle(

                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
                onPressed: () {},
              ),
            ),
      SizedBox(
      height: 15,
    ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.forgotPassword,
                  style: TextStyle(  decoration: TextDecoration.underline,fontSize: 15, fontWeight: FontWeight.w500, color: Colors.blueAccent),
                ),
                Text(
                  AppString.SignUp,
                  style: TextStyle(  decoration: TextDecoration.underline,fontSize: 15, fontWeight: FontWeight.w500, color: Colors.blueAccent),
                ),
              ],
            )
          ],

        ),
      ),
    );
  }
}
